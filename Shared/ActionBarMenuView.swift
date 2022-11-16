//
//  ActionBarMenuView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI

struct ActionBarMenuView: View {
    
    @Binding var showHomeView: Bool
    @Binding var showSearchView: Bool
    @Binding var showSearchPLayListView: Bool

    
    public init (showHomeView:Binding<Bool>, showSearchView:Binding<Bool>, showSearchPLayListView:Binding<Bool> ){
        
        self._showHomeView = showHomeView
        self._showSearchView = showSearchView
        self._showSearchPLayListView = showSearchPLayListView
        
    }
    var body: some View {
    
        VStack {
            Spacer()
            HStack(alignment: .bottom){
                VStack(spacing:-10.0){
                    Button(action: {
                        showHomeView = true
                        showSearchView = false
                        showSearchPLayListView = false
                       }, label: {
                           HStack{
                               Image(systemName: "house.fill")
                                   .resizable()
                                   .frame(width: 30, height: 30)
                                   .padding()
                                   .foregroundColor(Color.white)
                           }
                       })
                    Text("Inicio")
                        .foregroundColor(Color.white)
                        .font(.system(size: 13))
                    
                }
                .padding(.bottom, 8)
                
                VStack(spacing:-10.0){
                    Button(action: {
                        showHomeView = false
                        showSearchView = true
                        showSearchPLayListView = false
                       }, label: {
                           HStack{
                               Image(systemName: "magnifyingglass")
                                   .resizable()
                                   .frame(width: 30, height: 30)
                                   .padding()
                                   .foregroundColor(Color.white)
                           }
                       })
                    Text("Buscar")
                        .foregroundColor(Color.white)
                        .font(.system(size: 13))
                    
                }
                .padding(.bottom, 8)
                .padding(.horizontal, 60)
                
                VStack(spacing:-10.0){
                    Button(action: {
                        showHomeView = false
                        showSearchView = false
                        showSearchPLayListView = true
                       }, label: {
                           HStack{
                               Image(systemName: "books.vertical.fill")
                                   .resizable()
                                   .frame(width: 30, height: 30)
                                   .padding()
                                   .foregroundColor(Color.white)
                           }
                       })
                    Text("Mi Biblioteca")
                        .foregroundColor(Color.white)
                        .font(.system(size: 13))
                    
                }
                .padding(.bottom, 8)
                
            }
            .frame(maxWidth: 414, maxHeight: 60)
            .background(Color("fullBackground"))
        }
        
            
    }
}

struct ActionBarMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ActionBarMenuView(showHomeView: .constant(true), showSearchView: .constant(false), showSearchPLayListView: .constant(false))
    }
}
