//
//  RegisterView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI

struct RegisterView: View {
    
    var body: some View {
        VStack{
//            Image()
            VStack{
                
                Text("Crear Cuenta")
                    .foregroundColor(Color.white)
                    .font(.system(size: 30, weight: .heavy, design: .default))
                    
                
//
//                TextField("Nombre de usuario", text:)
//                    .frame(width: 370,height:50)
//                    .background()
//                    .cornerRadius(10)
//                    .multilineTextAlignment(.leading)
//
                   
//                TextField("Email")
//                    .frame(width: 370,height:50)
//                    .background()
//                    .cornerRadius(10)
//
//                TextField("Password")
//                    .frame(width: 370,height:50)
//                    .background()
//                    .cornerRadius(10)
            }
            .padding(.top,80)
            VStack{
                Button(action: {
                   
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
                       print("Regístrate con Google")
                   }, label: {
                       HStack(spacing:15){
                           Image("iconGoogle")
                               .resizable()
                               .frame(width: 22, height: 22)
                               
                           Text("Regístrate con Google")
                               .font(.system(size: 15, weight: .heavy, design: .default))
                       }
                       .padding()
                       
                   })
                    .frame(width: 240)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
            
                
                Button(action: {
                       print("¿Ya está registrado? Inicie sesión aquí")
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
        RegisterView()
    }
}
