//
//  LibraryView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/26/22.
//

import SwiftUI

struct LibraryView: View {
    
    @State var showSearchLibaryView: Bool = false
    @State var showCreateNewPlayListView: Bool = false
    
    var body: some View {
        
        ZStack{
            VStack{
                HStack(spacing: 40){
                    
                    HStack(spacing: 10){
                        
                        Image("aslan")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                        
                        Text("Mi Librería")
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.white)
                            .font(.system(size: 23, weight: .heavy, design: .default))
                    }
                    Spacer()
                    HStack{
                        Button(action: {
                            showSearchLibaryView.toggle()
                           }, label: {
                               HStack{
                                   Image(systemName: "magnifyingglass")
                                       .resizable()
                                       .frame(width: 23, height: 23)
                                       .foregroundColor(Color.white)
                               }
                           })
                        
                        Button(action: {
                            showCreateNewPlayListView.toggle()
                           }, label: {
                               HStack{
                                   Image(systemName: "plus")
                                       .resizable()
                                       .frame(width: 23, height: 23)
                                       .padding()
                                       .foregroundColor(Color.white)
                               }
                           })
                    }
                    
                   
                }
                .padding(.top,30)
                Spacer()
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.black))
            
            if showSearchLibaryView {
                SearchPlayListView(showSearchPlayListView: $showSearchLibaryView)
            }
            if showCreateNewPlayListView {
                CreateNewPlayListView(showCreateNewPlayListView: $showCreateNewPlayListView)
            }
            
        }
        
        
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView(showSearchLibaryView: false, showCreateNewPlayListView: false)
    }
}
