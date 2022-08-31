//
//  ContentView.swift
//  Shared
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var user: User
    
    var body: some View {
        
        Group {
            if user.isUserAuthenticated == .undefined {
                RegisterView()
            } else if user.isUserAuthenticated == .signedOut {
                LoginView()
            } else {
                HomeView(showSettings: .constant(true), showEditProfileView: .constant(true))
            }
        }
        .onAppear() {
            self.user.configureFirebaseStateDidChange()
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
