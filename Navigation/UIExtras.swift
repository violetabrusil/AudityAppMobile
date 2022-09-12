//
//  UIExtras.swift
//  
//
//  Created by Violeta on 9/11/22.
//

import Foundation

public final class UIExtras {
   
   private lazy var extras = [String: Any]()
   
   public init() {}
   
   public func set(key: String, value: Any) -> Bool {
      guard !key.isEmpty else {
         return false
      }
      extras[key] = value
      return true
   }
   
   public func getValue<T>(with key: String) -> T? {
      guard !key.isEmpty, extras.keys.contains(key) else {
         return nil
      }
      return extras[key] as? T
   }
   
   public func removeValue(key: String) {
      guard !key.isEmpty, extras.keys.contains(key) else {
         return
      }
      _ = extras.removeValue(forKey: key)
   }
   
}
