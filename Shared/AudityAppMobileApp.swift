//
//  AudityAppMobileApp.swift
//  Shared
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI
import Firebase

final class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct AudityAppMobileApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var sessionService = SessionServiceImpl()
    
    var body: some Scene {
        WindowGroup {
            switch sessionService.state {
            case .loggedIn:
                HomeView(showSettings: .constant(true), showEditProfileView: .constant(true))
            case .loggedOut:
                RegisterView()
            }
        }
    }
}
