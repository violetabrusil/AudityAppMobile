//
//  AudityAppMobileApp.swift
//  Shared
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct AudityAppMobileApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
    
    var body: some Scene {
        WindowGroup {
            
            let user = UserViewModel()
            ContentView()
                .environmentObject(user)
//
//            SearchView()
        }
    }
}

final class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        //Firebase with email and password
        FirebaseApp.configure()
  
        return true
    }
    
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
      -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
}
