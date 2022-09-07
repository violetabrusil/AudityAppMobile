////
////  MerchantBaseViewModel.swift
////
////
////  Created by Diego Morales on 7/28/22.
////
//
//import Foundation
//import Combine
////import eWalletCore
//
//open class MerchantBaseViewModel: ObservableObject {
//
//   @Published public var errorMessage: String = ""
//   @Published public var showAlert = false
//   @Published public var isBusy = false
//   @Published public var goToNextScreen = false
//   @Published public var nextScreenType = ""
//   @Published public var showAuth: Bool = false
//   @Published public var showNoInternetError: Bool = false
//   @Published public var toastMesssage: String = ""
//   @Published public var showToast: Bool = false
//
////   public var extras: UIExtras = UIExtras()
//
////   public var currentError: String = ""
//
////   public lazy var cancelBag: CancelBag = CancelBag()
//
////   public init() {
////      bindErrorMessage()
////      bindGoToNextScreen()
////   }
////
//   public func bindGoToNextScreen(){
//      $goToNextScreen
//         .dropFirst()
//         .sink(receiveValue: {[weak self] value in
//            if value{
//               CoreAppMerchant.shared.router.toAnyView(anyView: CoreAppMerchant.shared.neutralUiFactory.getViewOf(type: NeutralScreenType(rawValue: self?.nextScreenType ?? ""), extras: self?.extras ?? UIExtras()), id: self?.nextScreenType ?? "")
//               self?.goToNextScreen = false
//            }
//         })
//         .cancel(with: cancelBag)
//   }
//
//   public func navigateToRoot(){
//      CoreAppMerchant.shared.currentRouter.popToRoot()
//   }
//
//   public func navigateToHome(){
//      CoreAppMerchant.shared.currentRouter.popToHome()
//   }
//
//   public func navigateToStartKYC(){
//      CoreAppMerchant.shared.currentRouter.popToStartKYC()
//   }
//
//   public func navigateToPreviousScreen(){
//      CoreAppMerchant.shared.currentRouter.popAction()
//   }
//
//   public func navigateToPreviousScreenWithExtras(){
//      CoreAppMerchant.shared.currentRouter.popWithExtras(screenType: self.nextScreenType , extras: self.extras)
//   }
//
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
//
//}
