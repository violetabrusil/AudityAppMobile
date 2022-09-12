//
//  MerchantBaseViewModel.swift
//
//
//  Created by Violeta on 9/11/22.
//

import Foundation
import Combine
//import eWalletCore

open class AudityBaseViewModel: ObservableObject {

//   @Published public var errorMessage: String = ""
//   @Published public var showAlert = false
//   @Published public var isBusy = false
   @Published public var goToNextScreen = false
   @Published public var nextScreenType = ""
    
    
//   @Published public var showAuth: Bool = false
//   @Published public var showNoInternetError: Bool = false
//   @Published public var toastMesssage: String = ""
//   @Published public var showToast: Bool = false

   public var extras: UIExtras = UIExtras()

//   public var currentError: String = ""

   public lazy var cancelBag: CancelBag = CancelBag()

   public init() {
//      bindErrorMessage()
      bindGoToNextScreen()
   }
//
   public func bindGoToNextScreen(){
      $goToNextScreen
         .dropFirst()
         .sink(receiveValue: {[weak self] value in
            if value{
                CoreAudityApp.shared.router.toAnyView(anyView: CoreAudityApp.shared.uiFactory.getViewOf(type: NeutralScreenType(rawValue: self?.nextScreenType ?? ""), extras: self?.extras ?? UIExtras()), id: self?.nextScreenType ?? "")
               self?.goToNextScreen = false
            }
         })
         .cancel(with: cancelBag)
   }

   public func navigateToRoot(){
       CoreAudityApp.shared.router.popToRoot()
   }

   public func navigateToHome(){
       CoreAudityApp.shared.router.popToHome()
   }

   public func navigateToPreviousScreen(){
       CoreAudityApp.shared.router.popAction()
   }

   public func navigateToPreviousScreenWithExtras(){
       CoreAudityApp.shared.router.popWithExtras(anyView: CoreAudityApp.shared.uiFactory.getViewOf(type: NeutralScreenType(rawValue: self.nextScreenType), extras: self.extras), id: self.nextScreenType)
   }

//   public func bindErrorMessage() {
//      $errorMessage
//         .sink(receiveValue: { [weak self] in
//            if !$0.isEmpty{
//               self?.currentError = $0
//               self?.showAlert = !$0.isEmpty
//            }
//            else{
//               self?.currentError = ""
//               self?.showAlert = false
//            }
//         })
//         .cancel(with: cancelBag)
//   }

}
