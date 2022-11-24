//
//  SettingsView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/24/22.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var showEditProfileView = false
    @EnvironmentObject var user: UserViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack (spacing: 30){
           
            HStack{
                Button(action: {
                    dismiss()
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
                
                if user.user?.photo != "" {
                    AsyncImage(url: URL(string: user.user?.photo ?? "")) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 80, height:80)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 80, height:80)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .foregroundColor(Color(.gray))
                    
                }
                
                
                VStack(spacing: 5){
                    
                    Text(user.user?.userName ?? "")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .heavy, design: .default))
                    
                    Text("Editar perfil")
             
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 15))
                }
              
                Button(action: {
                    showEditProfileView = true
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
            
            HStack(spacing: 20){
                Spacer()
                VStack (spacing:10){
                    
                    Text("Información")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 20, weight: .heavy, design: .default))

                    Text("Email")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .heavy, design: .default))
                        .padding(.top, 20)
                    
                    Text(user.user?.email ?? "")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 16))
                    
                    Text("Nombre de usuario")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .heavy, design: .default))
                        .padding(.top, 10)
                    
                    Text(user.user?.userName ?? "")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 16))
                    
                }
                
            }.padding(.top, 5)
  
            VStack{
            
                Button(action: {
                    user.signOut()
                   }, label: {
                       HStack{
                           Text("Salir")
                               .font(.system(size: 15, weight: .heavy, design: .default))
                       }
                       .padding()
                      
                   })
                    .frame(width: 150)
                    .background(Color("GrayColor"))
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
            }
            .padding(.top, 100.0)

    
            
        }
        .padding(.bottom, 200.0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("fullBackground"))
        .fullScreenCover(isPresented: $showEditProfileView) {
            EditProfileView(showEditProfileView: $showEditProfileView)
//                .environmentObject(user)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
