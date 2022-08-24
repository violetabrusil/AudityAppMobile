//
//  SplashScreenView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack{
            HomeView()
            ActionBarMenuView()
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
