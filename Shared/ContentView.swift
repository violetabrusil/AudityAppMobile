//
//  ContentView.swift
//  Shared
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var user: UserViewModel
    let audityViewModel = AudityBaseViewModel()
    
//    marcos.brusil@gmail.com
//    12345678
    
    var body: some View {
        ZStack(alignment: .top){
            if user.userIsAuthenicatedAndSynced {
                CoreAudityApp.shared.uiFactory.getViewOf(type: NeutralScreenType.SplashScreenView)


            } else {
                NavigationView{
                    CoreAudityApp.shared.uiFactory.getViewOf(type: NeutralScreenType.LoginView)
                }
                .navigationBarHidden(true)
                .navigationViewStyle(StackNavigationViewStyle())
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
