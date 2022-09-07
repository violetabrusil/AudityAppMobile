//
//  NeutralRouter.swift
//  
//
//  Created by Diego Morales on 7/28/22.
//

import Foundation
import SwiftUI

public class NeutralRouter {
   private let navStack: NavigationStack
   
   public init(navStack: NavigationStack) {
      self.navStack = navStack
   }
   
   public init() {
      self.navStack = NavigationStack()
   }
   
   public func toAnyView(anyView: AnyView, id: String){
      self.navStack.push(anyView, withId: id)
   }
   
   public func popAction(){
      self.navStack.pop()
   }
   
   public func popWithExtras(anyView: AnyView, id: String) {
      self.navStack.popWithExtras(anyView, withId: id)
   }
   
   public func popToRoot(){
      self.navStack.pop(to: .root)
   }
//
//   public func popToHome(){
//      if self.navStack.containsView(withId: ScreenType.Home.rawValue){
//         self.navStack.pop(to: .view(withId: ScreenType.Home.rawValue))
//      }
//      else{
//         self.navStack.push(CoreAppClient.shared.uiFactory.getViewOf(type: ScreenType.Home, extras: UIExtras()), withId: ScreenType.Home.rawValue)
//      }
//   }
//
//   public func popToStartKYC(){
//      if self.navStack.containsView(withId: ScreenType.KYCStartScreen.rawValue){
//         self.navStack.pop(to: .view(withId: ScreenType.KYCStartScreen.rawValue))
//      }
//      else{
//         self.navStack.push(CoreAppClient.shared.uiFactory.getViewOf(type: ScreenType.KYCStartScreen, extras: UIExtras()), withId: ScreenType.KYCStartScreen.rawValue)
//      }
//   }
}
