//
//  File.swift
//  
//
//  Created by Diego Morales on 7/28/22.
//

import Foundation
import SwiftUI
import Resolver

internal class NeutralUIBuilder: NeutralScreenBuilder {
    func getNotFound() -> AnyView {
        AnyView(Text("NotFoundView"))
    }
}

public protocol NeutralScreenBuilder {
   func getViewOf(type: NeutralScreenType, extras: UIExtras?) -> AnyView
   func getNotFound() -> AnyView
}


