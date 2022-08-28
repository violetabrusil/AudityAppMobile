//
//  RegistrationViewModel.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/27/22.
//

import Foundation
import Combine

enum RegistrationState {
    case successful
    case failed(error: Error)
    case na
}

protocol RegistrationViewModel {
    func register()
    var service: RegistrationFireBaseService { get }
    var state: RegistrationState { get }
    var userDetails: RegistrationDetails { get }
    init(service: RegistrationFireBaseService)
}

final class RegistrationViewModelImpl: ObservableObject, RegistrationViewModel {
    
    let service: RegistrationFireBaseService
    var state: RegistrationState = .na
    var userDetails: RegistrationDetails = RegistrationDetails.new
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: RegistrationFireBaseService) {
        self.service = service
    }
    
    func register() {
        
        service
            .register(with: userDetails)
            .sink { [weak self ] res in
                switch res {
                case .failure(let error):
                    self?.state = .failed(error: error)
                default: break
                }
                
            } receiveValue: { [weak self] in
                self?.state = .successful
            }
            .store(in: &subscriptions)
        
    }
    
}
