//
//  CreateNewPlayListView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/24/22.
//

import SwiftUI

struct CreateNewPlayListView: View {
 
    @ObservedObject var playlistModel = PlayListViewModel()
    @ObservedObject var user = UserViewModel()
    @Environment(\.dismiss) var dismiss
    @State var namePlaylist: String = ""
    @State var success = false
    @State var showToast = false
 
    var body: some View {
        VStack{
            HStack{
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
            }
            .padding(.leading, 300.0)
            Spacer()
            VStack{
                Text("Escriba un nombre para la lista")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                    .font(.system(size: 25, weight: .heavy, design: .default))
                    .padding(.top, 80)
                
                TextField("Nombre lista", text: $namePlaylist)
                    .frame(width: 380,height:50)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                    .padding(.top, 20)
                
                Button(action: {
                    if user.uuid != "" && namePlaylist != "" {
                        let parameters: [String: Any] = ["namePlayList": namePlaylist, "userId": user.uuid!]
                        playlistModel.createPlayList(parameters: parameters)
                        success = true
                        showToast = true
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
                            showToast = false
                            dismiss()
                        }
                    } else {
                        print("Error al crear la lista de reproducción")
                    }
                   }, label: {
                       HStack{
                           Text("Crear")
                               .font(.system(size: 20, weight: .heavy, design: .default))
                       }
                       .padding()
                      
                   })
                    .frame(width: 150)
                    .background(Color("GreenColor"))
                    .foregroundColor(Color.white)
                    .cornerRadius(50)
                    .padding(.top, 30)
                
            }
            .padding(.bottom,200)
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("background")
        )
        .toast(isPresenting: $showToast, message: "Lista de reproducción creada")
    }
}

struct CreateNewPlayListView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewPlayListView()
    }
}
