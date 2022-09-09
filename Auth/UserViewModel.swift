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
    private func sync() {
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
    
    
    
    
    
    
    
}
