//
//  EditProfileView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/24/22.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        VStack{
            HStack(spacing:100){
                Button(action: {
                       print("Close")
                   }, label: {
                       HStack{
                           Image(systemName: "xmark")
                               .resizable()
                               .frame(width: 15, height: 15)
                               .padding()
                               .foregroundColor(Color.white)
                       }
                   })
                
                Text("Editar perfil")
                    .frame(width: 100)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 5)
                    .foregroundColor(Color.white)
                    .font(.system(size: 16, weight: .heavy, design: .default))
            
                Button(action: {
                       print("Settings")
                   }, label: {
                       HStack{
                           Image(systemName: "square.and.arrow.down")
                               .resizable()
                               .frame(width: 20, height: 25)
                               .padding()
                               .foregroundColor(Color.white)
                       }
                   })
            }
            Spacer()
            VStack{
                
                Image("aslan")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                
                Button(action: {
                       print("Cambiar foto")
                   }, label: {
                       HStack{
                           Text("Cambiar foto")
                               .font(.system(size: 15, weight: .heavy, design: .default))
                          
                       }
                       .padding()
                      
                   })
                    .frame(width: 150)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                  
                    
                Text("Nombre Autor")
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.trailing, 255.0)
                
            }
            .padding(.bottom, 300.0)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.black))
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
