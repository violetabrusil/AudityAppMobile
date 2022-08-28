//
//  RegistrationDetails.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/27/22.
//

import Foundation

struct RegistrationDetails {
    
    var access: String
    var email: String
    var password: String
    var photo: String
    var rol: String
    var userName: String

}

extension RegistrationDetails {
    
    static var new: RegistrationDetails {
        
        RegistrationDetails(access: "",
                            email: "",
                            password: "",
                            photo: "",
                            rol: "",
                            userName: "")
    }
}
