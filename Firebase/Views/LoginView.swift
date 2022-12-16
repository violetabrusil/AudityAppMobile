//
//  LoginView.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 8/30/22.
//

import SwiftUI
import Firebase
import GoogleSignIn
import ToastSwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    @EnvironmentObject var user: UserViewModel
    @State var validation: Validations = Validations()
    @State var buttonLoginPressed = false
    @State var showToast = false
    @State var successLogin = false
    @State var showspinner = false
    
    var body: some View {
        
        NavigationStackView(navigationStack: viewModel.navigationStack){
            ZStack {
                Color("fullBackground")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Image("loginBackground")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.bottom, 160)
                
                Color("fullBackground")
                    .opacity(0.3)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack {

                    VStack{
                        
                        Image("iconAudity")
                            .resizable()
                            .frame(width: 130, height: 130)
                        
                        
                        Text("Cientos de audiolibros")
                            .foregroundColor(Color.white)
                            .font(.system(size: 30, weight: .heavy, design: .default))
                        Text("Disponibles en Audity")
                            .foregroundColor(Color.white)
                            .font(.system(size: 30, weight: .heavy, design: .default))
                        
                    }
                    .padding(.top, 200)
                    
                    VStack{
                        
                        HStack(spacing:5){
                            Image(systemName: "envelope.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(.leading,5)
                                .foregroundColor(Color("GreenColor"))
                            
                            TextField("Email", text: $validation.email)
                                .autocapitalization(.none)
                                .keyboardType(.emailAddress)
                                .disableAutocorrection(true)
                           
                        }
                        .frame(width: 370,height:50)
                        .background()
                        .cornerRadius(10)
                        
                       
                        if validation.validEmailText != "" && buttonLoginPressed{
                                Text(validation.validEmailText)
                                    .foregroundColor(Color(.red))
                                    .font(.system(size: 11, weight: .heavy, design: .default))
                                    .padding(.trailing,240)
                                
                        }
                        
                        
                        
                        HStack(spacing:5){
                            Image(systemName: "key.fill")
                                .resizable()
                                .frame(width: 21, height: 25)
                                .padding(.leading,5)
                                .foregroundColor(Color("GreenColor"))
                            
                            SecureField("Password", text: $validation.password)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                           
                        }
                        .frame(width: 370,height:50)
                        .background()
                        .cornerRadius(10)
                        
                     
                        if validation.validPassText != "" && buttonLoginPressed{
                                Text(validation.validPassText)
                                    .foregroundColor(Color(.red))
                                    .font(.system(size: 11, weight: .heavy, design: .default))
                                    .padding(.trailing,200)
                                
                        }
                            
                        HStack{
                            Spacer()
                            Button(action: {
                                viewModel.goToForgotPasswordView()
                            }, label: {
                                Text("Olvidó su contraseña")
                            })
                                .frame(width: 185, alignment: .leading)
                                .foregroundColor(Color.blue)
                                .padding(.top, 2)
                             
                        }
                        .padding(.bottom)
                    }
                    .padding(.top,1)
                    
                    
                    
                    VStack{
                        
                        Button(action: {
                            self.buttonLoginPressed = true
                            
                            if validation.isLogInComplete{
                                user.loginUser(email: validation.email, password: validation.password)
                                showspinner = true
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
                                    if user.userIsAuthenicatedAndSynced{
                                        successLogin = true
                                    }
                                    showspinner = false
                                    showToast = true
                                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
                                        showToast = false
                                    }
                                }
                            }
                           
                            
                        }, label: {
                            HStack{
                                if showspinner{
                                    ProgressView()
                                }
                                else{
                                    Text("Ingresar")
                                        .font(.system(size: 15, weight: .heavy, design: .default))
                                }
                                
                            }
                            .padding()
                            
                        })
                            .frame(width: 220)
                            .background(Color("GreenColor"))
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                        
                        Button(action: {
                            user.loginWithGoogle()
                        }, label: {
                            HStack(spacing:15){
                                Image("iconGoogle")
                                    .resizable()
                                    .frame(width: 22, height: 22)
                                
                                Text("Ingresa con Google")
                                    .font(.system(size: 15, weight: .heavy, design: .default))
                            }
                            .padding()
                            
                        })
                            .frame(width: 220)
                            .background(Color("BlueColor"))
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                        
                        Button(action: {
                            viewModel.goToRegisterView()
                        }, label: {
                            Text("¿Es nuevo aquí? Cree una cuenta")
                        })
                            .frame(width: 290)
                            .foregroundColor(Color.white)
                            .padding(.top,30)
                        
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .toast(isPresenting: $showToast, message: successLogin ? "Ingreso exitoso." : "Credenciales incorrectas. Intente nuevamente", icon: successLogin ? .success : .error)
                
            }
            
        }
        .ignoresSafeArea()
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(validation: Validations.init())
    }
}

