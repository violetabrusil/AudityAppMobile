//
//  MerchantScreenBuilder.swift
//  
//
//  Created by Violeta on 9/11/22.
//

import Foundation
import SwiftUI

public extension NeutralScreenBuilder {
    
    func getViewOf(type: NeutralScreenType, extras: UIExtras?) -> AnyView {
        switch type {
        case NeutralScreenType.LoginView:
            return getLoginView()
        
        case NeutralScreenType.RegisterView:
            return getRegisterView()
            
        case NeutralScreenType.ForgotPasswordView:
            return getForgotPasswordView()
        
        case NeutralScreenType.SplashScreenView:
            return getSplashScreenView()
            
        case NeutralScreenType.AudioBookInformationView:
            return getAudioBookInformationView(extras: extras)
 
        case NeutralScreenType.MoreInformationView:
            return getMoreInformationView(extras: extras)
            
//        case NeutralScreenType.AddToPlayListView:
//            return getAddToPlayListView()
            
//        case NeutralScreenType.MerchantConfirmRegistrationView:
//            return getMerchantConfirmRegistrationView(extras: extras)
 
//        case NeutralScreenType.ReviewView:
//            return getReviewView()
            
        default:
            return getNotFound()
        }
    }
    
    func getLoginView() -> AnyView {
        return AnyView(LoginView())
    }
    
    func getRegisterView() -> AnyView {
        return AnyView(RegisterView())
    }
    
    func getForgotPasswordView() -> AnyView {
        return AnyView(ForgotPasswordView())
    }
    
    func getSplashScreenView() -> AnyView {
        return AnyView(SplashScreenView())
    }
    
    func getAudioBookInformationView(extras: UIExtras?) -> AnyView {
        let audioBook = (extras?.getValue(with: "audioBook") as AudioBook?) ?? AudioBook()
        return AnyView(AudioBookInformationView(audioBook: audioBook))
    }
    
    func getMoreInformationView(extras: UIExtras?) -> AnyView {
        let audioBook = (extras?.getValue(with: "audioBook") as AudioBook?) ?? AudioBook()
        return AnyView(MoreInformationView(audioBook: audioBook))
    }
    
//    func getAddToPlayListView() -> AnyView {
//        return AnyView(AddToPlayListView())
//    }
//
//    func getReviewView() -> AnyView {
//        return AnyView(ReviewView())
//    }
    
   
//
}

public extension NeutralScreenType {
    static let LoginView = NeutralScreenType(rawValue: "LoginView")
    static let RegisterView = NeutralScreenType(rawValue: "RegisterView")
    static let ForgotPasswordView = NeutralScreenType(rawValue: "ForgotPasswordView")
    static let SplashScreenView = NeutralScreenType(rawValue: "SplashScreenView")
    static let AudioBookInformationView = NeutralScreenType(rawValue: "AudioBookInformationView")
    static let MoreInformationView = NeutralScreenType(rawValue: "MoreInformationView")
//    static let AddToPlayListView = NeutralScreenType(rawValue: "AddToPlayListView")
//    static let ReviewView = NeutralScreenType(rawValue: "ReviewView")
}

