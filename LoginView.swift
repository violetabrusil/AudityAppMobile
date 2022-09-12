//
//  LoginView.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 8/30/22.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct LoginView: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    @EnvironmentObject var user: UserViewModel
    @State private var email = ""
    @State private var password = ""
    
    
    var body: some View {
        
        NavigationStackView(navigationStack: viewModel.navigationStack){
            VStack {
                
                //          Image()
                
                VStack{
                    HStack(spacing:5){
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 21, height: 25)
                            .padding()
                            .foregroundColor(Color.green)
                        
                        TextField("Email", text: $email)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .disableAutocorrection(true)
                    }
                    .frame(width: 370,height:50)
                    .background()
                    .cornerRadius(10)
                    
                    HStack(spacing:5){
                        Image(systemName: "key.fill")
                            .resizable()
                            .frame(width: 21, height: 25)
                            .padding()
                            .foregroundColor(Color.green)
                        
                        SecureField("Password", text: $password)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    .frame(width: 370,height:50)
                    .background()
                    .cornerRadius(10)
                }
                .padding(.top,200)
                
                HStack{
                    Spacer()
                    NavigationLink(destination: ForgotPasswordView()){
                        Text ("Olvido su contraseña")
                    }
                    .navigationBarHidden(true)
                }.padding(.bottom)
                VStack{
                    
                    Button(action: {
                        user.loginUser(email: email, password: password)
                        
                    }, label: {
                        HStack{
                            Text("Ingresar")
                                .font(.system(size: 15, weight: .heavy, design: .default))
                            
                        }
                        .padding()
                        
                    })
                        .frame(width: 220)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                    
                    Button(action: {
                        user.loginWithGoogle()
                    }, label: {
                        HStack(spacing:15){
                            Image("iconGoogle")
                                .resizable()
                                .frame(width: 22, height: 22)
                            
                            Text("Ingresa con Google")
                                .font(.system(size: 15, weight: .heavy, design: .default))
                        }
                        .padding()
                        
                    })
                        .frame(width: 220)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                    
                    Button(action: {
                        viewModel.goToRegisterView()
                    }, label: {
                        Text("¿Es nuevo aquí? Cree una cuenta")
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
    
    
//    func loginWithGoogle() {
//
//        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
//        let config = GIDConfiguration(clientID: clientID)
//        GIDSignIn.sharedInstance.signIn(with: config,
//                                        presenting: getRootViewController()) {
//            [self] user, error in
//
//            if let error = error {
//                print(error.localizedDescription)
//                return
//            }
//
//            guard
//                let autentication = user?.authentication,
//                let idToken = autentication.idToken
//            else {
//                return
//            }
//
//            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
//                                                           accessToken: autentication.accessToken)
//
//            //Firebase Auth
//            Auth.auth().signIn(with: credential) { result, err in
//                if let error = error {
//                    print(error.localizedDescription)
//                    return
//                }
//                guard let user = result?.user else { return }
//
//                print(user.displayName ?? "Success")
//
//                var userGoogle = User()
//
//                userGoogle.email = user.email ?? "."
//                userGoogle.photo = user.photoURL?.absoluteString ?? "."
//                userGoogle.userName = user.displayName ?? "."
//
//                self.storeUserInformation(user: userGoogle)
//
//            }
//        }
//
//    }
//
//    private func storeUserInformation(user: User) {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//        let userData = ["access": user.access,
//                        "email": user.email,
//                        "photo": user.photo,
//                        "rol": user.rol,
//                        "userName": user.userName]
//
//        Firestore.firestore().collection("users")
//            .document(uid)
//            .setData(userData) { err in
//                if let err = err {
//                    print(err)
//                    return
//                }
//                print("Success")
//            }
//
//    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

//extension View {
//    func getRect()->CGRect{
//        return UIScreen.main.bounds
//    }
//
//    func getRootViewController()->UIViewController{
//        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
//            return .init()
//        }
//
//        guard let root = screen.windows.first?.rootViewController else{
//            return .init()
//        }
//
//        return root
//    }
//}
