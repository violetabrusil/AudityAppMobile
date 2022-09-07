//
//  PopView.swift
//  
//
//  Created by Diego Morales on 2/2/22.
//

import SwiftUI

public enum PopDestination {
    case previous
    case root
    case view(withId: String)
}

public struct PopView<Label, Tag>: View where Label: View, Tag: Hashable {
    @EnvironmentObject private var navigationStack: NavigationStack
    private let label: Label
    private let destination: PopDestination
    private let tag: Tag?
    @Binding private var isActive: Bool
    @Binding private var selection: Tag?

    public init(destination: PopDestination = .previous,
                tag: Tag, selection: Binding<Tag?>,
                @ViewBuilder label: () -> Label) {

        self.init(destination: destination,
                  isActive: Binding.constant(false),
                  tag: tag,
                  selection: selection,
                  label: label)
    }

    private init(destination: PopDestination,
                 isActive: Binding<Bool>, tag: Tag?,
                 selection: Binding<Tag?>,
                 @ViewBuilder label: () -> Label) {

        self.label = label()
        self.destination = destination
        self._isActive = isActive
        self._selection = selection
        self.tag = tag
    }

    public var body: some View {
        if let selection = selection, let tag = tag, selection == tag {
            DispatchQueue.main.async {
                self.selection = nil
                pop()
            }
        }
        if isActive {
            DispatchQueue.main.async {
                isActive = false
                pop()
            }
        }
        return label.onTapGesture {
            pop()
        }
    }

    private func pop() {
        navigationStack.pop(to: destination)
    }
}

public extension PopView where Tag == Never {

    init(destination: PopDestination = .previous,
         @ViewBuilder label: () -> Label) {

        self.init(destination: destination,
                  isActive: Binding.constant(false),
                  tag: nil,
                  selection: Binding.constant(nil),
                  label: label)
    }

    init(destination: PopDestination = .previous,
         isActive: Binding<Bool>,
         @ViewBuilder label: () -> Label) {

        self.init(destination: destination,
                  isActive: isActive,
                  tag: nil,
                  selection: Binding.constant(nil),
                  label: label)
    }
}
