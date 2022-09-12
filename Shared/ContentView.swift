//
//  ContentView.swift
//  Shared
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var user: UserViewModel
    
    var body: some View {
        ZStack(alignment: .top){
            NavigationView{
                CoreAudityApp.shared.uiFactory.getViewOf(type: NeutralScreenType.SplashScreenView)
            }
            .navigationBarHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
        }
//        if user.userIsAuthenicatedAndSynced {
//            NavigationView{
//                CoreAudityApp.shared.uiFactory.getViewOf(type: NeutralScreenType.LoginView)
//            }
//            .navigationBarHidden(true)
//            .navigationViewStyle(StackNavigationViewStyle())
//
//        } else {
//            LoginView()
//        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
