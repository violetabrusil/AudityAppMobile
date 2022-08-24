//
//  SettingsView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/24/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        VStack (spacing: 30){
           
            HStack{
                Button(action: {
                       print("Arrow")
                   }, label: {
                       HStack{
                           Image(systemName: "arrow.left")
                               .resizable()
                               .frame(width: 20, height: 20)
                               .padding()
                               .foregroundColor(Color.white)
                       }
                   })
                
                Text("Configuración")
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                    .padding(.trailing, 20.0)
                    .foregroundColor(Color.white)
                    .font(.system(size: 18, weight: .heavy, design: .default))
                    
            }
        
            
            HStack(spacing:40){
                
                Image("aslan")
                    .resizable()
                    .frame(width: 80, height:80)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    
                VStack{
                    
                    Text("Nombre de usuario")
                    
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .heavy, design: .default))
                    
                    Text("Editar perfil")
             
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 15))
                }
              
                Button(action: {
                       print("Arrow")
                   }, label: {
                       HStack{
                           Image(systemName: "pencil")
                               .resizable()
                               .frame(width: 20, height: 20)
                               .padding()
                               .foregroundColor(Color.white)
                       }
                   })
                  
                    
            }
            
  
            
            VStack (spacing:10){
                
                Text("Información")
                
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.white)
                    .font(.system(size: 20, weight: .heavy, design: .default))
                    .padding(.trailing, 250.0)
                    
                
                Text("Nombre de usuario")
                
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.white)
                    .font(.system(size: 16, weight: .heavy, design: .default))
                    .padding(.trailing, 215.0)
                    .padding(.top, 20)
                
                Text("Editar perfil")
         
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.white)
                    .font(.system(size: 16))
                    .padding(.trailing, 280.0)
                
                
                Text("Nombre de usuario")
                
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.white)
                    .font(.system(size: 16, weight: .heavy, design: .default))
                    .padding(.trailing, 215.0)
                    .padding(.top, 10)
                
                Text("Editar perfil")
         
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.white)
                    .font(.system(size: 16))
                    .padding(.trailing, 280.0)
                
            }
            .padding(.vertical,20.0)
            
            VStack{
            
                Button(action: {
                       print("Salir")
                   }, label: {
                       HStack{
                           Text("Salir")
                               .font(.system(size: 15, weight: .heavy, design: .default))
                       }
                       .padding()
                      
                   })
                    .frame(width: 150)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
            }
            .padding(.top, 100.0)

    
            
        }
        .padding(.bottom, 200.0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.black))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
