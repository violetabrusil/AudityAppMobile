//
//  RegisterView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI
import Firebase

struct RegisterView: View {
    
    @State var userInfo: User
    @State var user: UserViewModel = UserViewModel()
    
    var body: some View {
        VStack{
//            Image()
            VStack{
                
                Text("Crear Cuenta")
                    .foregroundColor(Color.white)
                    .font(.system(size: 30, weight: .heavy, design: .default))
                    
                TextField("Nombre de usuario", text: $userInfo.userName)
                    .frame(width: 370,height:50)
                    .background()
                    .cornerRadius(10)
                    .multilineTextAlignment(.leading)
                if  !user.validNameText.isEmpty {
                    Text(user.validNameText).font(.caption).foregroundColor(.red)
                }

                   
                TextField("Email", text: $userInfo.email)
                    .frame(width: 370,height:50)
                    .background()
                    .autocapitalization(.none).keyboardType(.emailAddress)
                    .cornerRadius(10)
                if  !user.validPasswordText.isEmpty {
                    Text(user.validPasswordText).font(.caption).foregroundColor(.red)
                }
                

                TextField("Password", text: $userInfo.password)
                    .frame(width: 370,height:50)
                    .background()
                    .cornerRadius(10)
            }
            .padding(.top,80)
            VStack{
                Button(action: {
                   handleAction()
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
    
    private func handleAction() {
        createNewAccount()
    }
    
    private func createNewAccount() {
        Auth.auth().createUser(withEmail: userInfo.email, password: userInfo.password) { result, err in
            if let err = err {
                print("Failed to create user: ",err)
                return
            }
            
            print("Succesfully created user: \(result?.user.uid ?? "")")
            
            self.storeUserInformation()
        }
        
    }
    
    private func storeUserInformation() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let userData = ["access": userInfo.access,
                        "email": userInfo.email,
                        "photo": userInfo.photo,
                        "rol": userInfo.rol,
                        "userName": userInfo.userName]
        
        Firestore.firestore().collection("users")
            .document(uid)
            .setData(userData) { err in
                if let err = err {
                    print(err)
                    return
            }
            print("Success")
    }
    
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(userInfo: User.init(), user: UserViewModel.init())
    }
}
