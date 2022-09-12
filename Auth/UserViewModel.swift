//
//  UserViewModel.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 8/30/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import GoogleSignIn
import SwiftUI

class UserViewModel: ObservableObject {
    
    @Published var user: User?
    
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
    
    var uuid: String? {
        auth.currentUser?.uid
    }
    
    var userIsAuthenicated: Bool {
        auth.currentUser != nil
    }
    
    var userIsAuthenicatedAndSynced: Bool {
        
        user != nil && userIsAuthenicated
        
    }
    
    //Firebase Auth Function
    
    func loginUser(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else { return }
            DispatchQueue.main.async {
                self?.sync()
            }
        }
    }
    
    func loginWithGoogle() {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: config,
                                        presenting: getRootViewController()) {
            [self] user, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard
                let autentication = user?.authentication,
                let idToken = autentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: autentication.accessToken)
            
            //Firebase Auth
            auth.signIn(with: credential) { result, err in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let user = result?.user else { return }
                
                print(user.displayName ?? "Success")
                
                var userGoogle = User()
                
                userGoogle.email = user.email ?? "."
                userGoogle.photo = user.photoURL?.absoluteString ?? "."
                userGoogle.userName = user.displayName ?? "."
                
                self.storeUserInformation(user: userGoogle)
                
                DispatchQueue.main.async {
                    self.sync()
                    self.user = userGoogle
                }
                
                
            }
        }
        
    }
    
    
    func createNewAccount(access: String, email: String, password: String, rol: String, userName: String, photo: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else { return }
            DispatchQueue.main.async {
                self?.add(User(access: access, email: email, photo: photo, rol: rol, userName: userName))
                self?.sync()
            }
        }
    }
    
    func signOut() {
        do{
            try auth.signOut()
            self.user = nil
        }
        catch {
            print("Error signing out user: \(error)")
        }
    }
    
    //Firebase functions for user data
    public func sync() {
        guard userIsAuthenicated else { return }
        db.collection("users").document(self.uuid!).getDocument { (document, error) in
            guard document != nil, error == nil else { return }
            do {
                try self.user = document!.data(as: User.self)
            } catch {
                print("Sync error: \(error)")
            }
        }
    }
    
    private func add(_ user: User) {
        guard userIsAuthenicated else { return }
        do {
            let _ = try db.collection("users").document(self.uuid!).setData(from: user)
        } catch {
            print("Error adding: \(error)")
        }
    }
    
    private func update() {
        guard userIsAuthenicatedAndSynced else { return }
        do {
            let _ = try db.collection("users").document(self.uuid!).setData(from: user)
        } catch {
            print ("Error updating; \(error)")
        }
    }
    
    private func storeUserInformation(user: User) {
        guard let uid =  auth.currentUser?.uid else { return }
        print("uid: \(uid)")
        let userData = ["access": user.access,
                        "email": user.email,
                        "photo": user.photo,
                        "rol": user.rol,
                        "userName": user.userName]
        
        db.collection("users")
            .document(uid)
            .setData(userData) { err in
                if let err = err {
                    print(err)
                    return
                }
                print("Success")
            }
        
    }
    
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
    
    func getRootViewController()->UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else{
            return .init()
        }
        
        return root
    }
    
    
    
    
    
    
    
}
