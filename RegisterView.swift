//
//  RegisterView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI
import Firebase

struct RegisterView: View {
    
    @EnvironmentObject var user: UserViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var userName = ""
    @State private var photo = ""
    @State var validation: Validations = Validations()
    @ObservedObject var viewModel = AudityBaseViewModel()
    
    var body: some View {
        VStack{
//            Image()
            VStack{
                
                Text("Crear Cuenta")
                    .foregroundColor(Color.white)
                    .font(.system(size: 30, weight: .heavy, design: .default))
                    
                TextField("Nombre de usuario", text: $userName)
                    .frame(width: 370,height:50)
                    .background()
                    .cornerRadius(10)
                    .multilineTextAlignment(.leading)
            
                TextField("Email", text: $email)
                    .frame(width: 370,height:50)
                    .background()
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .cornerRadius(10)
            
                SecureField("Password", text: $password)
                    .frame(width: 370,height:50)
                    .background()
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .cornerRadius(10)
            }
            .padding(.top,80)
            VStack{
                Button(action: {
                    user.createNewAccount(access: "true", email: email, password: password, rol: "final", userName: userName, photo: photo)
                   }, label: {
                       HStack{
                           Text("Registrar")
                               .font(.system(size: 15, weight: .heavy, design: .default))
                       }
                       .padding()
                      
                   })
                    .frame(width: 240)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                
                Button(action: {
                    viewModel.navigateToPreviousScreen()
                    
                   }, label: {
                       Text("¿Ya está registrado? Inicie sesión aquí")
                   })
                    .frame(width: 290)
                    .foregroundColor(Color.white)
                    .padding(.top,100)
                
            }
            .padding(.top,50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.black))
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(validation: Validations.init())
    }
}
