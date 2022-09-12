//
//  NeutralUIFactory.swift
//
//
//  Created by Violeta on 9/11/22.
//

import Foundation
import SwiftUI

open class NeutralUIFactory {
    
    public var screenBuilder : NeutralScreenBuilder
    
    public init(screenBuilder: NeutralScreenBuilder? = nil) {
        if let screenBuilder = screenBuilder {
                 self.screenBuilder = screenBuilder
              } else {
                 self.screenBuilder = NeutralUIBuilder()
              }
    }
    
    open func getViewOf(type: NeutralScreenType, extras: UIExtras? = nil) -> AnyView {
        return screenBuilder.getViewOf(type: type, extras: extras)
    }
    
}
