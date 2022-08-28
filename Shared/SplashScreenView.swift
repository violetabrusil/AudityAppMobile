//
//  SplashScreenView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI

struct SplashScreenView: View {
    
    @ObservedObject var viewModel: SplashScreenViewModel = SplashScreenViewModel()
    
    var body: some View {
        ZStack{
            if viewModel.showSearchPLayListView {
                LibraryView()
            }
            if viewModel.showSearchView {
                SearchView()
            }
            if viewModel.showHomeView {
                HomeView(showSettings: $viewModel.showSettingsView, showEditProfileView: $viewModel.showEditProfileView)
            }
            
            ActionBarMenuView(showHomeView: $viewModel.showHomeView, showSearchView: $viewModel.showSearchView, showSearchPLayListView: $viewModel.showSearchPLayListView)
            
            if viewModel.showEditProfileView {
                EditProfileView(showEditProfileView: $viewModel.showEditProfileView)
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
