//
//  SessionService.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/27/22.
//

import Combine
import Foundation
import FirebaseAuth
import FirebaseDatabase

enum SessionState {
    case loggedIn
    case loggedOut
}

protocol SessionService {
    var state: SessionState { get }
    var userDetails: SessionUserDetails? { get }
    func logout()
}

final class SessionServiceImpl: ObservableObject, SessionService {
    
    @Published var state: SessionState = .loggedOut
    @Published var userDetails: SessionUserDetails?
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        setupFirebaseAuthHandler()
    }
    
    func logout() {
        try? Auth.auth().signOut()
    }
}

private extension SessionServiceImpl {
     
    func setupFirebaseAuthHandler() {
        
        handler = Auth
            .auth()
            .addStateDidChangeListener { [weak self] res, user in
                guard let self = self else { return }
                self.state = user == nil ? .loggedOut : .loggedIn
                if let uid = user?.uid {
                    self.handleRefresh(with: uid)
                }
            }
    }
    
    func handleRefresh(with uid: String) {
        
        Database
            .database()
            .reference()
            .child("users")
            .child(uid)
            .observe(.value) { [weak self] snapshot in
                
                guard let self  = self,
                      let value = snapshot.value as? NSDictionary,
                      let access = value[RegistrationKeys.access.rawValue] as? String,
                      let photo = value[RegistrationKeys.photo.rawValue] as? String,
                      let rol = value[RegistrationKeys.rol.rawValue] as? String,
                      let email = value[RegistrationKeys.email.rawValue] as? String,
                      let userName = value[RegistrationKeys.userName.rawValue] as? String else {
                          return
                      }
                DispatchQueue.main.async {
                    self.userDetails = SessionUserDetails(access: access,
                                                          userName: userName,
                                                          email: email,
                                                          photo: photo,
                                                          rol: rol)
                }
                    
            }
        
        
    }
}
