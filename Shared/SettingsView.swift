//
//  SettingsView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/24/22.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var showSettings: Bool
    @Binding var showEditProfileView: Bool
    @EnvironmentObject var user: UserViewModel
    
    public init (showSettings: Binding<Bool>, showEditProfileView: Binding<Bool>) {
        self._showSettings = showSettings
        self._showEditProfileView = showEditProfileView
    }
    
    var body: some View {
        
        VStack (spacing: 30){
           
            HStack{
                Button(action: {
                    showSettings.toggle()
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
                
                
                VStack{
                    
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
                    showEditProfileView.toggle()
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
                    
                
                Text("Email")
                
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.white)
                    .font(.system(size: 16, weight: .heavy, design: .default))
                    .padding(.trailing, 215.0)
                    .padding(.top, 20)
                
                Text(user.user?.email ?? "")
         
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
                
                Text(user.user?.userName ?? "")
         
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.white)
                    .font(.system(size: 16))
                    .padding(.trailing, 280.0)
                
            }
            .padding(.vertical,20.0)
            
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
        SettingsView(showSettings: .constant(false),showEditProfileView: .constant(false))
    }
}
