//
//  LoginFireBaseService.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/27/22.
//

import Combine
import Foundation
import FirebaseAuth

protocol LoginFireBaseService {
    func login(with credentials: LoginCredentials) -> AnyPublisher<Void, Error>
}

final class LoginFireBaseServiceImpl: LoginFireBaseService {
    
    func login(with credentials: LoginCredentials) -> AnyPublisher<Void,Error> {
        
        Deferred {
            
            Future { promise in
                
                Auth
                    .auth()
                    .signIn(withEmail: credentials.email,
                            password: credentials.password) { res, error in
                        
                        if let err = error {
                            promise(.failure(err))
                        } else {
                            promise(.success(()))
                        }
                    }
                
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
                            
    }
    
}
