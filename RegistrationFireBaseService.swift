//
//  RegistrationFireBaseService.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/27/22.
//

import Combine
import Foundation
import Firebase
import FirebaseDatabase

enum RegistrationKeys: String {
    case access = "true"
    case photo
    case rol = "final"
    case userName
    case email
}

protocol RegistrationFireBaseService {
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error>
}

final class RegistrationFireBaseServiceImpl: RegistrationFireBaseService {
    
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error> {
        
        Deferred {
            
            Future { promise in
                
                Auth.auth()
                    .createUser(withEmail: details.email,
                                password: details.password) { res, error in
                        
                        if let err = error {
                            promise(.failure(err))
                        } else {
                            
                            if let uid = res?.user.uid {
                                
                                let values = [RegistrationKeys.access.rawValue: details.access,
                                              RegistrationKeys.photo.rawValue: details.photo,
                                              RegistrationKeys.rol.rawValue: details.rol,
                                              RegistrationKeys.email.rawValue: details.email,
                                              RegistrationKeys.userName.rawValue: details.userName] as [String : Any]
                                
                                Database.database()
                                        .reference()
                                        .child("users")
                                        .child(uid)
                                        .updateChildValues(values) { error, ref in
                                            
                                            if let err = error {
                                                promise(.failure(err))
                                            } else {
                                                promise(.success(()))
                                            }
                                            
                                        }
                                
                                
                            } else {
                                promise(.failure(NSError(domain: "Invalid User Id", code: 0, userInfo: nil)))
                            }
                        }
                    }
                
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
        
    }
}
