////
////  MerchantScreenBuilder.swift
////  
////
////  Created by Diego Morales on 7/28/22.
////
//
//import Foundation
//import SwiftUI
////import Resolver
////import eWalletCore
//
//public extension NeutralScreenBuilder {
//   func getViewOf(type: NeutralScreenType, extras: UIExtras?) -> AnyView {
//      switch type {
//         case NeutralScreenType.MerchHomeScreenView:
//            return getMerchantHomeScreenView()
//            
//         case NeutralScreenType.MerchLaunchScreenView:
//            return getMerchantLaunchScreenView()
//            
//         case NeutralScreenType.MerchantConfirmRegistrationView:
//            return getMerchantConfirmRegistrationView(extras: extras)
//            
//         case NeutralScreenType.MerchantSumQRPaymentView:
//            return getMerchantSumQRPaymentView()
//          
//         case NeutralScreenType.MerchantQRPaymentGenerationView:
//            return getMerchantQRPaymentGenerationView(extras: extras)
//          
//         case NeutralScreenType.MerchantPaymentConfirmationView:
//            return getMerchantPaymentConfirmationView(extras: extras)
//          
//         case NeutralScreenType.MerchantPaymentErrorView:
//            return getMerchantPaymentErrorView()
//          
//            
//         default:
//            return getNotFound()
//      }
//   }
//   
//   func getMerchantHomeScreenView() -> AnyView {
//      return AnyView(MerchantHomeScreenView())
//   }
//   
//   func getMerchantLaunchScreenView() -> AnyView {
//      return AnyView(MerchantLaunchScreenView())
//   }
//   
//   func getMerchantConfirmRegistrationView(extras: UIExtras?) -> AnyView {
//      let merchantLocation = (extras?.getValue(with: "locationName") as String?) ?? ""
//      let merchantAddress = (extras?.getValue(with: "locationAddress") as String?) ?? ""
//      return AnyView(MerchantConfirmRegistrationView(merchantLocation: merchantLocation, merchantAddress: merchantAddress))
//   }
//   
//   func getMerchantSumQRPaymentView() -> AnyView {
//      return AnyView(MerchantSumQRPaymentView())
//   }
//   
//   func getNotFound() -> AnyView {
//      return AnyView(NotFoundView())
//   }
//   
//   func getMerchantNameThisDeviceView() -> AnyView {
//      return AnyView(MerchantNameThisDeviceView())
//   }
//   
//   func getMerchantRegistrarionSuccessfulView() -> AnyView{
//      return AnyView(MerchantRegistrarionSuccessfulView())
//   }
//    
//   func getMerchantQRPaymentGenerationView(extras: UIExtras?) -> AnyView{
//       
//      let name = (extras?.getValue(with: "name") as String?) ?? ""
//      let address = (extras?.getValue(with: "address") as String?) ?? ""
//      let amount = (extras?.getValue(with: "amount") as String?) ?? ""
//      let currencyCode = (extras?.getValue(with: "currencyCode") as String?) ?? ""
//      return AnyView(MerchantQRPaymentGenerationView(name: name, address: address, currencyCode: currencyCode, amount: amount))
//   }
//    
//   func getMerchantPaymentConfirmationView(extras: UIExtras?) -> AnyView{
//      let amount = (extras?.getValue(with: "amount") as String?) ?? ""
//      let currencyCode = (extras?.getValue(with: "currencyCode") as String?) ?? ""
//      let merchantTittle = (extras?.getValue(with: "merchantTittle") as String?) ?? ""
//      return AnyView(MerchantPaymentConfirmationView(amount: amount, merchantTittle: merchantTittle, currencyCode: currencyCode))
//   }
//    
//   func getMerchantPaymentErrorView() -> AnyView{
//      return AnyView(MerchantPaymentErrorView())
//   }
//}
//
//public extension NeutralScreenType{
//   static let MerchHomeScreenView = NeutralScreenType(rawValue: "MerchHomeScreenView")
//   static let MerchLaunchScreenView = NeutralScreenType(rawValue: "MerchLaunchScreenView")
//   static let MerchantConfirmRegistrationView = NeutralScreenType(rawValue: "MerchantConfirmRegistrationView")
//   static let MerchantSumQRPaymentView = NeutralScreenType(rawValue: "MerchantSumQRPaymentView")
//   static let MerchantNameThisDeviceView = NeutralScreenType(rawValue: "MerchantNameThisDeviceView")
//   static let MerchantRegistrarionSuccessfulView = NeutralScreenType(rawValue: "MerchantRegistrarionSuccessfulView")
//   static let MerchantQRPaymentGenerationView = NeutralScreenType(rawValue: "MerchantQRPaymentGenerationView")
//   static let MerchantPaymentConfirmationView = NeutralScreenType(rawValue: "MerchantPaymentConfirmationView")
//   static let MerchantPaymentErrorView = NeutralScreenType(rawValue: "MerchantPaymentErrorView")
//}
//
