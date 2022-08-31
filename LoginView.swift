//
//  LoginView.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 8/30/22.
//

import SwiftUI
import Firebase

struct LoginView: View {
        
    @State var userInfo: User
    
    var body: some View {
        
        VStack {
            
//          Image()
            
            VStack{
                HStack(spacing:5){
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 21, height: 25)
                        .padding()
                        .foregroundColor(Color.green)
                        
                    TextField("Email", text: $userInfo.email)
                }
                .frame(width: 370,height:50)
                .background()
                .cornerRadius(10)
                
                HStack(spacing:5){
                    Image(systemName: "key.fill")
                        .resizable()
                        .frame(width: 21, height: 25)
                        .padding()
                        .foregroundColor(Color.green)
                        
                    SecureField("Password", text: $userInfo.password)
                }
                .frame(width: 370,height:50)
                .background()
                .cornerRadius(10)
            }
            .padding(.top,200)
            
            HStack{
                Spacer()
                Button(action: {
                    ForgotPasswordView()
                }) {
                    Text ("Olvido su contraseña")
                }
            }.padding(.bottom)
            
            VStack{
                
                Button(action: {
                   
                   }, label: {
                       HStack{
                           Text("Ingresar")
                               .font(.system(size: 15, weight: .heavy, design: .default))
                          
                       }
                       .padding()
                      
                   })
                    .frame(width: 220)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                
                Button(action: {
                       print("Ingresa con Google")
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
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
            
                
                Button(action: {
                    RegisterView(userInfo: User.init())
                   }
                       , label: {
                       Text("¿Es nuevo aquí? Cree una cuenta")
                     
                       
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
    
    private func loginUser() {
        Auth.auth().signIn(withEmail: userInfo.email, password: userInfo.password) { result, err in
            if let err = err {
                print("Failed to login user: \(err)")
                return
            }
            print("Succesfully logged in as user")
        }
    }

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(userInfo: User.init())
    }
}
