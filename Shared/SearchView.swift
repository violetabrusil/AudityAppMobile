//
//  SearchView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/24/22.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var audioBookListVM = AudioBookListViewModel()
    @State private var searchText: String = ""
    @State private var searchPerTitle: Bool = true
    @State private var searchPerAuthor: Bool = false
    @State private var searchPerGender: Bool = false
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemBackground]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBackground]
        navBarAppearance.backgroundColor = UIColor.black
        navBarAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().tintColor = UIColor.systemBackground
    }
    
    var body: some View {
        
        VStack{
            
            HStack{
                
                Button(action: {
                    searchPerTitle = true
                    searchPerAuthor = false
                    searchPerGender = false
                    
                }, label: {
                    HStack{
                        Text("Título")
                            .font(.system(size: 15, weight: .heavy, design: .default))
                        
                    }
                    .padding()
                    
                })
                    .frame(width: 100)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                
                Button(action: {
                    searchPerTitle = false
                    searchPerAuthor = true
                    searchPerGender = false
                    
                }, label: {
                    HStack{
                        Text("Autor")
                            .font(.system(size: 15, weight: .heavy, design: .default))
                        
                    }
                    .padding()
                    
                })
                    .frame(width: 100)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                
                Button(action: {
                    searchPerTitle = false
                    searchPerAuthor = false
                    searchPerGender = true
                    
                }, label: {
                    HStack{
                        Text("Género")
                            .font(.system(size: 15, weight: .heavy, design: .default))
                        
                    }
                    .padding()
                    
                })
                    .frame(width: 100)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                
            }
            .padding(.top, 10)
            
            
            ZStack{
                
                if searchPerTitle == true {
                    NavigationView{
                        
                        ZStack{
                            Color(.black)
                                .ignoresSafeArea()
                            List(audioBookListVM.audioBooks, id: \.idAudioBook) { audioBook in
                                
                                HStack(spacing:30){
                                    AsyncImage(url: audioBook.image, content: { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100)
                                    }, placeholder: {
                                        ProgressView()
                                    })
                                    
                                    VStack{
                                        Text(audioBook.titleAudioBook)
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .heavy, design: .default))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.leading)
                                        Text(audioBook.author)
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.leading)
                                        Text(audioBook.gender)
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.leading)
                                        Text(audioBook.year)
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                                .frame(maxWidth: .infinity,maxHeight: .infinity)
                                .background(Color(.black))
                                .listRowBackground(Color.black)
                            }
                            .listStyle(.plain)
                            .searchable(text: $searchText)
                            .foregroundColor(.white)
                            .onChange(of: searchText) { value in
                                async {
                                    if !value.isEmpty && value.count > 3 {
                                        await audioBookListVM.search(title: value)
                                    } else {
                                        audioBookListVM.audioBooks.removeAll()
                                    }
                                }
                                
                            }
                            .navigationTitle("Buscar por título")
                        }
                    }
                    
                }
                
                if searchPerAuthor == true {
                    NavigationView{
                        ZStack{
                            Color(.black)
                                .ignoresSafeArea()
                            List(audioBookListVM.audioBooks, id: \.idAudioBook) { audioBook in
                                HStack{
                                    AsyncImage(url: audioBook.image, content: { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100)
                                    }, placeholder: {
                                        ProgressView()
                                    })
                                    VStack{
                                        Text(audioBook.titleAudioBook)
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .heavy, design: .default))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.leading)
                                        Text(audioBook.author)
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.leading)
                                        Text(audioBook.gender)
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.leading)
                                        Text(audioBook.year)
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                                .frame(maxWidth: .infinity,maxHeight: .infinity)
                                .background(Color(.black))
                                .listRowBackground(Color.black)
                            }.listStyle(.plain)
                                .searchable(text: $searchText)
                                .foregroundColor(.white)
                                .onChange(of: searchText) { value in
                                    async {
                                        if !value.isEmpty && value.count > 3 {
                                            await audioBookListVM.searchPerAuhor(author: value)
                                        } else {
                                            audioBookListVM.audioBooks.removeAll()
                                        }
                                    }
                                    
                                }
                                .navigationTitle("Buscar por autor")
                            
                        }
                        
                        
                    }
                    
                }
                
                if searchPerGender == true {
                    
                    NavigationView{
                        ZStack{
                            Color(.black)
                                .ignoresSafeArea()
                            List(audioBookListVM.audioBooks, id: \.idAudioBook) { audioBook in
                                HStack{
                                    AsyncImage(url: audioBook.image, content: { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100)
                                    }, placeholder: {
                                        ProgressView()
                                    })
                                    VStack{
                                        Text(audioBook.titleAudioBook)
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .heavy, design: .default))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.leading)
                                        Text(audioBook.author)
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.leading)
                                        Text(audioBook.gender)
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.leading)
                                        Text(audioBook.year)
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                                .frame(maxWidth: .infinity,maxHeight: .infinity)
                                .background(Color(.black))
                                .listRowBackground(Color.black)
                            }.listStyle(.plain)
                                .searchable(text: $searchText)
                                .foregroundColor(.white)
                                .onChange(of: searchText) { value in
                                    async {
                                        if !value.isEmpty && value.count > 3 {
                                            await audioBookListVM.searchPerGender(gender: value)
                                        } else {
                                            audioBookListVM.audioBooks.removeAll()
                                        }
                                    }
                                    
                                }
                                .navigationTitle("Buscar por género")
                        }
                        
                    }
                    
                }
                
            }
        }
        .background(Color(.black))
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
