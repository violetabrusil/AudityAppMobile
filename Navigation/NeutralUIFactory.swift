////
////  NeutralUIFactory.swift
////  
////
////  Created by Diego Morales on 7/28/22.
////
//
//import Foundation
//import SwiftUI
//
//open class NeutralUIFactory {
//   
//   public var screenBuilder: NeutralScreenBuilder
//   public var fontBuilder: FontBuilder
//   public var colorBuilder: ColorBuilder
//   public var assetBuilder: AssetBuilder
//   public var localizableBuilder: LocalizableBuilder
//   
//   public init(screenBuilder: NeutralScreenBuilder? = nil, fontBuilder: FontBuilder? = nil, colorBuilder: ColorBuilder? = nil, assetBuilder: AssetBuilder? = nil, localizableBuilder: LocalizableBuilder? = nil) {
//      if let screenBuilder = screenBuilder {
//         self.screenBuilder = screenBuilder
//      } else {
//         self.screenBuilder = NeutralUIBuilder()
//      }
//      
//      if let fontBuilder = fontBuilder {
//         self.fontBuilder = fontBuilder
//      } else {
//         self.fontBuilder = DefaultFontBuilder()
//      }
//      
//      if let colorBuilder = colorBuilder {
//         self.colorBuilder = colorBuilder
//      } else {
//         self.colorBuilder = DefaultColorBuilder()
//      }
//      
//      if let assetBuilder = assetBuilder {
//         self.assetBuilder = assetBuilder
//      } else {
//         self.assetBuilder = DefaultAssetBuilder()
//      }
//      
//      if let localizableBuilder = localizableBuilder {
//         self.localizableBuilder = localizableBuilder
//      } else {
//         self.localizableBuilder = DefaultLocalizableBuilder()
//      }
//   }
//   
//   open func getViewOf(type: NeutralScreenType, extras: UIExtras? = nil) -> AnyView {
//      return screenBuilder.getViewOf(type: type, extras: extras)
//   }
//   
//   open func getFont(type: String) -> Font {
//      return fontBuilder.getFont(type: type)
//   }
//   
//   open func getUIFont(type: String) -> UIFont {
//      return fontBuilder.getUIFont(type: type)
//   }
//   
//   open func getColor(color: String) -> Color {
//      return colorBuilder.getColor(color: color)
//   }
//   
//   open func getAsset(name: String) -> Image {
//      return assetBuilder.getAsset(name: name)
//   }
//   
//   open func getLocalizableBundle(tableName: String, asset: String) -> String {
//      return localizableBuilder.getLocalizableBundle(tableName: tableName, asset: asset)
//   }
//   
//}
