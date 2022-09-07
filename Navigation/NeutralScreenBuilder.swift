////
////  File.swift
////  
////
////  Created by Diego Morales on 7/28/22.
////
//
//import Foundation
//import SwiftUI
////import Resolver
//
//internal class NeutralUIBuilder: NeutralScreenBuilder {}
//
//public protocol NeutralScreenBuilder {
//   func getViewOf(type: NeutralScreenType, extras: UIExtras?) -> AnyView
//   func getNotFound() -> AnyView
//}
//
//public extension NeutralScreenBuilder {
//   
//   func getViewOf(type: NeutralScreenType, extras: UIExtras?) -> AnyView {
//      switch type {
//         default:
//            return getNotFound()
//      }
//   }
//   
//   func getNotFound() -> AnyView {
//      return AnyView(NotFoundView())
//   }
//}
//
