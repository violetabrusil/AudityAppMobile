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
        NavigationStackView(navigationStack: viewModel.navigationStack){
            ZStack{
                if viewModel.showSearchPLayListView {
                    LibraryView()
                }
                if viewModel.showSearchView {
                    SearchView()
                }
                if viewModel.showHomeView {
                    HomeView()
                }
                
                ActionBarMenuView(showHomeView: $viewModel.showHomeView, showSearchView: $viewModel.showSearchView, showSearchPLayListView: $viewModel.showSearchPLayListView)
                
                if viewModel.showEditProfileView {
                    EditProfileView()
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
