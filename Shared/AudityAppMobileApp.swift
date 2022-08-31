//
//  AudityAppMobileApp.swift
//  Shared
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI
import Firebase

@main
struct AudityAppMobileApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            RegisterView(userInfo: User.init())
        }
    }
}

final class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
