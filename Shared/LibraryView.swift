//
//  LibraryView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/26/22.
//

import SwiftUI

struct LibraryView: View {
    
    @State var showSearchLibaryView = false
    @State var showCreateNewPlayListView = false
    @StateObject var playListViewModel = PlayListViewModel()
    @EnvironmentObject var user : UserViewModel
    
    var body: some View {
        
        ZStack{
            VStack{
                HStack(spacing: 40){
                    
                    HStack(spacing: 10){
                        
                        VStack{
                            AsyncImage(url: URL(string: user.user?.photo ?? "")) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                                
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height:50)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                            
                        }
                        .padding(.leading, 20)
                        
                        Text("Mi Librería")
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.white)
                            .font(.system(size: 23, weight: .heavy, design: .default))
                    }
                    Spacer()
                    HStack{
//                        Button(action: {
//                            showSearchLibaryView = true
//                        }, label: {
//                            HStack{
//                                Image(systemName: "magnifyingglass")
//                                    .resizable()
//                                    .frame(width: 23, height: 23)
//                                    .foregroundColor(Color.white)
//                            }
//                        })
                        
                        Button(action: {
                            showCreateNewPlayListView = true
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
                
                VStack{
                    
                    ScrollView (.vertical, showsIndicators: false) {
                        
                        HStack(spacing: 13){
                            ForEach(playListViewModel.playList, id:\.self) { playList in
                                PlayListView(playList: playList)
                            }
                        }
                    }
                    .onAppear{
                        playListViewModel.searchPlayListPerUser(wordToSearch: user.uuid ?? "")
                        
                    }
                    
                    
                }.padding(.top,20)
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("fullBackground"))
            
            //            if showSearchLibaryView {
            //                SearchPlayListView(showSearchPlayListView: $showSearchLibaryView)
            //            }
            //            if showCreateNewPlayListView {
            //                CreateNewPlayListView(showCreateNewPlayListView: $showCreateNewPlayListView)
            //            }
            
            .fullScreenCover(isPresented: $showSearchLibaryView) {
                //SearchPlayListView()
            }
            .fullScreenCover(isPresented: $showCreateNewPlayListView) {
                CreateNewPlayListView()
            }
            
        }
        
        
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
