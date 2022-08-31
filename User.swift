//
//  User.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 8/30/22.
//

import Foundation

class User: ObservableObject {
    
    enum FBAuthState {
        case undefined, signedOut, signedIn
    }
    
    @Published var isUserAuthenticated: FBAuthState = .undefined
    
    func configureFirebaseStateDidChange() {
        self.isUserAuthenticated = .signedOut
//        self.isUserAuthenticated = .signedIn
    }
    
}
