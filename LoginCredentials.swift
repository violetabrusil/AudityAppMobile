//
//  LoginCredentials.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/27/22.
//

import Foundation

struct LoginCredentials {
    var email: String
    var password: String
}

extension LoginCredentials {
    
    static var new: LoginCredentials {
        LoginCredentials(email: "",
                         password: "")
    }
}
