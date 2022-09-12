//
//  NeutralRouter.swift
//  
//
//  Created by Violeta on 9/11/22.
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

   public func popToHome(){
       if self.navStack.containsView(withId: NeutralScreenType.SplashScreenView.rawValue){
         self.navStack.pop(to: .view(withId: NeutralScreenType.SplashScreenView.rawValue))
      }
      else{
         self.navStack.push(CoreAudityApp.shared.uiFactory.getViewOf(type: NeutralScreenType.SplashScreenView, extras: UIExtras()), withId: NeutralScreenType.SplashScreenView.rawValue)
      }
   }


}
