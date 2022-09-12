//
//  SplashScreenViewModel.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/26/22.
//

import Foundation

open class SplashScreenViewModel: AudityBaseViewModel {
    
    public var navigationStack: NavigationStack = NavigationStack()
    @Published var showHomeView: Bool = true
    @Published var showSearchView: Bool = false
    @Published var showSearchPLayListView: Bool = false
    @Published var showSettingsView: Bool = false
    @Published var showEditProfileView: Bool = false
    
    public override init(){
        super.init()
        CoreAudityApp.shared.router = NeutralRouter(navStack: navigationStack)
    }
    

    
    
}
