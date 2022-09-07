//
//  NavigationStack.swift
//  
//
//  Created by Diego Morales on 2/2/22.
//

import SwiftUI

enum NavigationType {
    case push
    case pop
}

public class NavigationStack: ObservableObject {

    public static let defaultEasing = Animation.easeOut(duration: 0.2)

    @Published var currentView: ViewElement?
    private(set) var navigationType = NavigationType.push
    private let easing: Animation

    public init(easing: Animation = defaultEasing) {
        self.easing = easing
    }

    private var viewStack = ViewStack() {
        didSet {
            currentView = viewStack.peek()
        }
    }

    public var depth: Int {
        viewStack.depth
    }

    public func containsView(withId id: String) -> Bool {
        viewStack.indexForView(withId: id) != nil
    }

    public func push<Element: View>(_ element: Element, withId identifier: String? = nil) {
        withAnimation(easing) {
            navigationType = .push
            viewStack.push(ViewElement(id: identifier == nil ? UUID().uuidString : identifier!,
                                       wrappedElement: AnyView(element)))
        }
    }

    public func pop(to: PopDestination = .previous) {
        withAnimation(easing) {
            navigationType = .pop
            switch to {
            case .root:
                viewStack.popToRoot()
            case .view(let viewId):
                viewStack.popToView(withId: viewId)
            default:
                viewStack.popToPrevious()
            }
        }
    }
   
   public func popWithExtras<Element: View>(_ element: Element, withId identifier: String? = nil) {
      withAnimation(easing) {
         navigationType = .pop
         viewStack.popToPreviousWithExtras(ViewElement(id: identifier == nil ? UUID().uuidString : identifier! , wrappedElement: AnyView(element)))
      }
   }
}

private struct ViewStack {
    private var views = [ViewElement]()

    func peek() -> ViewElement? {
        views.last
    }

    var depth: Int {
        views.count
    }

    mutating func push(_ element: ViewElement) {
        guard indexForView(withId: element.id) == nil else {
            print("Duplicated view identifier: \"\(element.id)\". You are trying to push a view with an identifier that already exists on the navigation stack.")
            return
        }
        views.append(element)
    }

    mutating func popToPrevious() {
        _ = views.popLast()
    }
   
   mutating func popToPreviousWithExtras(_ element: ViewElement) {
       views.removeLast(2)
       guard indexForView(withId: element.id) == nil else {
           print("Duplicated view identifier: \"\(element.id)\". You are trying to push a view with an identifier that already exists on the navigation stack.")
           return
       }
       views.append(element)
   }

    mutating func popToView(withId identifier: String) {
        guard let viewIndex = indexForView(withId: identifier) else {
            print("Identifier \"\(identifier)\" not found. You are trying to pop to a view that doesn't exist.")
            return
        }
        views.removeLast(views.count - (viewIndex + 1))
    }

    mutating func popToRoot() {
        views.removeAll()
    }

    func indexForView(withId identifier: String) -> Int? {
        views.firstIndex {
            $0.id == identifier
        }
    }
}

struct ViewElement: Identifiable, Equatable {
    let id: String
    let wrappedElement: AnyView

    static func == (lhs: ViewElement, rhs: ViewElement) -> Bool {
        lhs.id == rhs.id
    }
}
