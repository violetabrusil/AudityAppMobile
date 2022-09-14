//
//  EditProfileView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/24/22.
//

import SwiftUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var user : UserViewModel
    @State var userName: String = ""
    @State var pressed = false
    
    var body: some View {
        VStack{
            HStack(spacing:100){
                Button(action: {
                    dismiss()
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
                    print("Save")
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
                
                if user.user?.photo != "" {
                    AsyncImage(url: URL(string: user.user?.photo ?? "")) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 200, height:200)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 200, height:200)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .foregroundColor(Color(.gray))
                    
                }
                
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
                
                ZStack{
                    TextField("", text: $userName)
                        .foregroundColor(Color.white)
                        .frame(width: 100, alignment: .center)
                        .disableAutocorrection(true)
                        .onTapGesture {
                            pressed.toggle()
                        }
                    Text(user.user?.userName ?? "")
                        .opacity(pressed ? 0 : 1)
                }
                
            }
            .padding(.bottom, 300.0)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        .cornerRadius(20)
        .background(Color(.gray))
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
