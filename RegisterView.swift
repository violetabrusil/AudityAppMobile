//
//  RegisterView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI
import ToastSwiftUI
import Firebase

struct RegisterView: View {
    
    @EnvironmentObject var user: UserViewModel
    @State private var photo = ""
    @State var validation: Validations = Validations()
    @State var buttonRegisterPressed = false
    @State private var showToast = false
    @State private var successRegister = false
    @ObservedObject var viewModel = AudityBaseViewModel()
    
    var body: some View {
        VStack{
            
            VStack{
                
                Image("iconAudity")
                    .resizable()
                    .frame(width: 130, height: 130)
                Text("Crear Cuenta")
                    .foregroundColor(Color.white)
                    .font(.system(size: 30, weight: .heavy, design: .default))
            }
            

            VStack{
                    
                TextField("Nombre de usuario", text: $validation.userName)
                    .frame(width: 370,height:50)
                    .background()
                    .cornerRadius(10)
                    .padding(.leading,5)
                    .multilineTextAlignment(.leading)
                if validation.validNameText != "" && buttonRegisterPressed{
                    Text(validation.validNameText)
                        .foregroundColor(Color(.red))
                        .font(.system(size: 11, weight: .heavy, design: .default))
                        .padding(.trailing,190)
                    
                }
                TextField("Email", text: $validation.email)
                    .frame(width: 370,height:50)
                    .background()
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .cornerRadius(10)
                    .padding(.leading,5)
                if validation.validEmailAddressText != "" && buttonRegisterPressed{
                    Text(validation.validEmailAddressText)
                        .foregroundColor(Color(.red))
                        .font(.system(size: 11, weight: .heavy, design: .default))
                        .padding(.trailing,50)
                }
            
                SecureField("Password", text: $validation.password)
                    .frame(width: 370,height:50)
                    .background()
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .cornerRadius(10)
                    .padding(.leading,5)
                if validation.validPasswordText != "" && buttonRegisterPressed{
                    Text(validation.validPasswordText)
                        .foregroundColor(Color(.red))
                        .font(.system(size: 11, weight: .heavy, design: .default))
                        .padding(.trailing,130)
                }
            }
            .padding(.top,20)
            VStack{
                Button(action: {
                    self.buttonRegisterPressed = true
                    
                    if validation.isSignInComplete{
                        successRegister = user.createNewAccount(access: "true", email: validation.email, password: validation.password, rol: "final", userName: validation.userName, photo: photo)
                        showToast = true
                        if successRegister{
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
                                viewModel.navigateToPreviousScreen()
                            }
                        }
                        else{
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
                                showToast = false
                            }
                        }
                    }
                    
                   }, label: {
                       HStack{
                           Text("Registrar")
                               .font(.system(size: 15, weight: .heavy, design: .default))
                       }
                       .padding()
                      
                   })
                    .frame(width: 240)
                    .background(Color("GreenColor"))
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
        .background(Color("fullBackground"))
        .toast(isPresenting: $showToast, message: successRegister ? "Registro completado exitosamente." : "Error de registro. Intente nuevamente", icon: successRegister ? .success : .error)
        
        
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(validation: Validations.init())
    }
}
