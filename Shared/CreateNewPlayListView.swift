//
//  CreateNewPlayListView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/24/22.
//

import SwiftUI

class TextFieldManager: ObservableObject {
    
    let characterLimit = 15
    @Published var limitExceeded: Bool = false
    
    @Published var namePlayList = "" {
        
        didSet {
            if namePlayList.count > characterLimit {
                namePlayList = String(namePlayList.prefix(characterLimit))
                limitExceeded = true
            } else {
                limitExceeded = false
            }
        }
    }
}

struct CreateNewPlayListView: View {
 
    @ObservedObject var playlistModel = PlayListViewModel()
    @ObservedObject var user = UserViewModel()
    @Environment(\.dismiss) var dismiss
    @ObservedObject var textFieldManager = TextFieldManager()
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
                
                TextField("Nombre lista", text: $textFieldManager.namePlayList)
                    .frame(width: 380,height:50)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                    .padding(.top, 20)
  
                if textFieldManager.limitExceeded {
                    HStack{
                        Spacer()
                        Text("Límite de caracteres alcanzado.")
                            .foregroundColor(Color(.red))
                            .font(.system(size: 11, weight: .heavy, design: .default))
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                }
                
                Button(action: {
                    if user.uuid != "" && textFieldManager.namePlayList != "" {
                        let parameters: [String: Any] = ["namePlayList": textFieldManager.namePlayList, "userId": user.uuid!]
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
