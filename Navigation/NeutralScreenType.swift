//
//  NeutralScreenType.swift
//
//
//  Created by Violeta on 9/11/22.
//

import Foundation

public struct NeutralScreenType: RawRepresentable, Equatable, Hashable, Comparable {
   public var rawValue: String
      
   public static let NotFoundView = NeutralScreenType(rawValue: "NotFoundView")
   
   
   public init(rawValue: String) {
      self.rawValue = rawValue
   }
   
   //MARK: Hashable
   public var hashValue: Int {
      return rawValue.hashValue
   }
   
   //MARK: Comparable
   public static func <(lhs: NeutralScreenType, rhs: NeutralScreenType) -> Bool {
      return lhs.rawValue < rhs.rawValue
   }
}
