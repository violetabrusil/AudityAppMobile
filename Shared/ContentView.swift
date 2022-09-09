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
        
        NavigationView{
            if user.userIsAuthenicatedAndSynced {
                SplashScreenView()
            } else {
                LoginView()
            }
        }.navigationBarHidden(true)
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
