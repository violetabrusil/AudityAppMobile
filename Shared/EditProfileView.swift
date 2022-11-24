//
//  EditProfileView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/24/22.
//

import SwiftUI
import FirebaseStorage

var FILE_NAME = ""

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var user : UserViewModel
    @State var userName: String = ""
    @State var imageURL: String = ""
    @State var pressed = false
    @State var shown = false
    @Binding var showEditProfileView: Bool
    @State var showToast = false
    
    public init (showEditProfileView: Binding<Bool>) {
        self._showEditProfileView = showEditProfileView
    }
    
    var body: some View {
        VStack{
            HStack(spacing:100){
                Button(action: {
                    dismiss()
                }, label: {
                    HStack{
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.leading, 30)
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
                    
                    var existChanges = false
                    if FILE_NAME != "" {
                        existChanges = true
                        user.user?.photo = imageURL
                    }
                    if userName != user.user?.userName  && userName != "" {
                        existChanges = true
                        user.user?.userName = userName
                    }
                    if existChanges {
                        user.update()
                        showToast = true
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
                            showToast = false
                            showEditProfileView = false
                        }
                        
                    }
                    
                }, label: {
                    HStack{
                        Image("save")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .padding(.trailing, 30)
                            .foregroundColor(Color.white)
                    }
                })
            }
            .padding(.top, 30)
          
            VStack{
                
                if imageURL != "" {
                    FirebaseImageView(imageURL: imageURL)
                } else {
                    if user.user?.photo != "" {
                        FirebaseImageView(imageURL: user.user?.photo ?? "")
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 200, height:200)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                            .foregroundColor(Color(.gray))
                    }
               
                    
                }
                VStack{
                    Button(action: { FILE_NAME = user.user?.userName ?? ""
                        self.shown.toggle() }) {
                        Text("Cambiar foto")
                                .font(.system(size: 20)).bold()
                    }.sheet(isPresented: $shown) {
                
                        imagePicker(shown: self.$shown, imageURL: self.$imageURL)
                    }
                    .padding(10)
                    .background(Color.clear)
                    .foregroundColor(Color.white)
                    
                }
                .onAppear(perform: loadImageFromFirebase)
                .animation(.spring(), value: 5)
              
                
            
                
                HStack{
                    TextField(user.user?.userName ?? "", text: $userName)
                        .foregroundColor(Color.black)
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                        .disableAutocorrection(true)
                        .onTapGesture {
                            pressed.toggle()
                        }
                }
                .frame(width: 220,height:40)
                .background(Color.white)
                .cornerRadius(20)
            }
            .padding(.top, 100)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .cornerRadius(20)
        .background(Color("fullBackground"))
        .toast(isPresenting: $showToast, message: "Datos actualizados correctamente")
        
    }
    
    func loadImageFromFirebase() {
        let storage = Storage.storage().reference(withPath: user.user?.photo ?? "")
        storage.downloadURL {(url, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            print("Download success")
            self.imageURL = "\(url!)"
            print(self.imageURL)
        }
    }
}



struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(showEditProfileView: .constant(true))
    }
}


