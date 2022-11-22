//
//  LoginView.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 8/30/22.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct LoginView: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    @EnvironmentObject var user: UserViewModel
    @State private var email = ""
    @State private var password = ""
    
    
    var body: some View {
        
        NavigationStackView(navigationStack: viewModel.navigationStack){
            ZStack {
                Color("fullBackground")
                
                Image("loginBackground")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.bottom, 160)
                
                Color("fullBackground")
                    .opacity(0.3)
                VStack {

                    VStack(){
                        
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
                                .padding()
                                .foregroundColor(Color("GreenColor"))
                            
                            TextField("Email", text: $email)
                                .autocapitalization(.none)
                                .keyboardType(.emailAddress)
                                .disableAutocorrection(true)
                        }
                        .frame(width: 370,height:50)
                        .background()
                        .cornerRadius(10)
                        
                        HStack(spacing:5){
                            Image(systemName: "key.fill")
                                .resizable()
                                .frame(width: 21, height: 25)
                                .padding()
                                .foregroundColor(Color("GreenColor"))
                            
                            SecureField("Password", text: $password)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }
                        .frame(width: 370,height:50)
                        .background()
                        .cornerRadius(10)
                        
                        HStack{
                            Spacer()
                            Button(action: {
                                viewModel.goToForgotPasswordView()
                            }, label: {
                                Text("Olvidó su contraseña")
                            })
                                .frame(width: 185, alignment: .leading)
                                .foregroundColor(Color.blue)
                                .padding(.top, 5)
                             
                        }
                        .padding(.bottom)
                    }
                    .padding(.top,30)
                    
                    
                    
                    VStack{
                        
                        Button(action: {
                            user.loginUser(email: email, password: password)
                            
                        }, label: {
                            HStack{
                                Text("Ingresar")
                                    .font(.system(size: 15, weight: .heavy, design: .default))
                                
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
                            .padding(.top,40)
                        
                        
                    }
                    
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
               
                
                
            }
            
        }
        .ignoresSafeArea()
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
