//
//  LoginViewModel.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 9/11/22.
//

import Foundation
import SwiftUI

open class LoginViewModel: AudityBaseViewModel {
    
    public var navigationStack: NavigationStack = NavigationStack()
    var userViewModel = UserViewModel()
    
    public override init(){
        super.init()
        CoreAudityApp.shared.router = NeutralRouter(navStack: navigationStack)
    }
    
    
    func goToRegisterView(){
        self.nextScreenType = NeutralScreenType.RegisterView.rawValue
        self.goToNextScreen = true
    }
    
    func goToForgotPasswordView(){
        self.nextScreenType = NeutralScreenType.ForgotPasswordView.rawValue
        self.goToNextScreen = true
    }


    
    
}
