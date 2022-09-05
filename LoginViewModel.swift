//
//  LoginViewModel.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/31/22.
//

import Foundation

open class LoginViewModel {
    
    public var navigationStack: NavigationStack = NavigationStack()
    
    public init(){
          CoreApp.shared.currentRouter = NeutralRouter(navStack: navigationStack)
    }
    
    public func nagivateHome() {
//        self.next
    }
    
    public func nagivateLogin() {
        
    }
    
    public func nagivateForgotPassword() {
        
    }
}
