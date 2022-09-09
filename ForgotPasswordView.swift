//
//  ForgotPasswordView.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 8/30/22.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State var user: Validations = Validations()
    
    var body: some View {
        
        VStack{
            TextField("Ingrese su correo electrónico", text: $user.email)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            Button(action: {
                //Reset action
            }) {
                Text("Cambiar contraseña")
                    .frame(width: 200)
                    .padding(.vertical , 5)
                    .background(Color.green)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .opacity(user.isEmailValid(_email: user.email) ? 1 : 0.75)
            }
            . disabled(!user.isEmailValid(_email: user.email))
            Spacer()
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
