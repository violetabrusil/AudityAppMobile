//
//  UserViewModel.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 8/30/22.
//

import Foundation

struct UserViewModel {
    
    var email: String = ""
    var password: String = ""
    var userName: String = ""
    
    func isEmpty(_field:String) -> Bool {
        return _field.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    func isEmailValid(_email: String) -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    "[A-Z0-9a-z._%+-]+@[A-Za-z0-9._]+\\.[A-Za-z]{2,64}")
        return emailTest.evaluate(with: email)
    }
    
    func isPasswordValid(_password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",
                                       "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$")
        return passwordTest.evaluate(with: password)
    }
    
    var isSignInComplete: Bool {
        if !isEmailValid(_email: email) ||
            isEmpty(_field: userName) ||
            isPasswordValid(_password: password){
            return false
        }
        return true
    }
    
    var isLogInComplete: Bool {
        if isEmpty(_field: email) ||
            isEmpty(_field: password) {
            return false
        }
        return true
    }
    
    var validNameText: String {
        if !isEmpty(_field: userName){
            return ""
        } else {
            return "Ingrese un nombre de usuario"
        }
    }
    
    var validEmailAddressText: String {
        if isEmailValid(_email: email){
            return ""
        } else {
            return "Introduzca una dirección de correo electrónico válida"
        }
    }
    
    var validPasswordText: String {
        if isPasswordValid(_password: password){
            return ""
        } else {
            return "Debe tener 8 caracteres que contengan al menos un número y una letra mayúscula"
        }
    }
    
    
}
