//
//  LoginView.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 8/30/22.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var user: User
    
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
                        
//                    TextField("Email", text: $vm.credentials.email)
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
                        
//                    TextField("Password", text: $vm.credentials.password)
                }
                .frame(width: 370,height:50)
                .background()
                .cornerRadius(10)
            }
            .padding(.top,200)
            
            VStack{
                
                Button(action: {
                    self.user.isUserAuthenticated = .signedIn
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
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
