//
//  SearchView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/24/22.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText: String = ""
    @State private var searchPerTitle: Bool = true
    @State private var searchPerAuthor: Bool = false
    @State private var searchPerGender: Bool = false
    let audityViewModel = AudityBaseViewModel()
    let audioBookViewModel = AudioBookViewModel()

    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemBackground]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBackground]
        navBarAppearance.backgroundColor = UIColor(Color("fullBackground"))
        navBarAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().tintColor = UIColor.systemBackground
        UITableView.appearance().backgroundColor = .yellow
  
    }
    
    var body: some View {
        
        ZStack{
            
            Color("fullBackground")
                .ignoresSafeArea(.all)
            
            VStack{
                
                HStack{
                    
                    Button(action: {
                        searchPerTitle = true
                        searchPerAuthor = false
                        searchPerGender = false
                        audioBookViewModel.audioBookList = []
                        searchText = ""
                        
                    }, label: {
                        HStack{
                            Text("Título")
                                .font(.system(size: 15, weight: .heavy, design: .default))
                            
                        }
                        .padding()
                        
                    })
                        .frame(width: 100)
                        .background(Color("GreenColor"))
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                    
                    Button(action: {
                        searchPerTitle = false
                        searchPerAuthor = true
                        searchPerGender = false
                        audioBookViewModel.audioBookList = []
                        searchText = ""
                        
                    }, label: {
                        HStack{
                            Text("Autor")
                                .font(.system(size: 15, weight: .heavy, design: .default))
                            
                        }
                        .padding()
                        
                    })
                        .frame(width: 100)
                        .background(Color("GreenColor"))
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                    
                    Button(action: {
                        searchPerTitle = false
                        searchPerAuthor = false
                        searchPerGender = true
                        audioBookViewModel.audioBookList = []
                        searchText = ""
                        
                    }, label: {
                        HStack{
                            Text("Género")
                                .font(.system(size: 15, weight: .heavy, design: .default))
                            
                        }
                        .padding()
                        
                    })
                        .frame(width: 100)
                        .background(Color("GreenColor"))
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                    
                }
                .background(Color("fullBackground"))
                .padding(.top, 10)
                
                ZStack{
                    
                    Color("fullBackground")
                        .ignoresSafeArea(.all)
                    
                    if searchPerTitle == true {
                        NavigationView{

                            ZStack{
                                
                                Color("fullBackground")
                                    .ignoresSafeArea(.all)
                                
                                VStack{
                                    List(audioBookViewModel.audioBookList, id: \.idAudioBook) { audioBook in
                                        
                                        ScrollView{
                                            ForEach(audioBookViewModel.audioBookList, id:\.self) { audioBook in
                                                VStack{
                                                    AudioBooksFromPlayList(audioBook: audioBook)
                                                }
                                                .frame(maxWidth: .infinity,maxHeight: .infinity)
                                             
                                            }
                                        }
                                        .listRowBackground( Color("fullBackground"))
                                      
                                    }
                                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                                    .listStyle(.plain)
                                    .searchable(text: $searchText)
                                    .padding(.top, 20)
                                    .foregroundColor(.white)
                                    .onChange(of: searchText) { value in
                                        Task.init {
                                            if !value.isEmpty && value.count > 3 {
                                                await audioBookViewModel.searchPerTitle(title: searchText)
                                            } else {
                                                audioBookViewModel.audioBookList.removeAll()
                                            }
                                        }

                                    }
                                    .navigationTitle("Buscar por título")
                                }
                                
                               
                         
                            }
                            .background(Color("fullBackground"))
                            .frame(maxWidth: .infinity,maxHeight: .infinity)

                        }
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                        .background(Rectangle().fill(Color("fullBackground")))
                        
   
                    }
                    
                    if searchPerAuthor == true {
                        NavigationView{

                            ZStack{
                                
                                List(audioBookViewModel.audioBookList, id: \.idAudioBook) { audioBook in

                                    VStack{
                                        ScrollView (.vertical, showsIndicators: false) {

                                            HStack(spacing: 13){
                                                ForEach(audioBookViewModel.audioBookList, id:\.self) { audioBook in
                                                    AudioBooksFromPlayList(audioBook: audioBook)
                                                }
                                            }
                                        }
        
                                    }
                                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                                    .listRowBackground(Color("fullBackground"))

                                }
                                .frame(maxWidth: .infinity,maxHeight: .infinity)
                                .listStyle(.plain)
                                .searchable(text: $searchText)
                                .padding(.top, 20)
                                .foregroundColor(.white)
                                .onChange(of: searchText) { value in
                                    Task.init {
                                        if !value.isEmpty && value.count > 3 {
                                            await audioBookViewModel.searchPerAuhor(author: searchText)
                                        } else {
                                            audioBookViewModel.audioBookList.removeAll()
                                        }
                                    }

                                }
                                .navigationTitle("Buscar por autor")
                         
                            }
                            .background(Color("fullBackground"))
                            .frame(maxWidth: .infinity,maxHeight: .infinity)

                        }
                        .frame(maxWidth: .infinity,maxHeight: .infinity)


                    }
                    
                    if searchPerGender == true {
                        
                        NavigationView{

                            ZStack{
                                
                                List(audioBookViewModel.audioBookList, id: \.idAudioBook) { audioBook in

                                    VStack{
                                        ScrollView (.vertical, showsIndicators: false) {

                                            HStack{
                                                ForEach(audioBookViewModel.audioBookList, id:\.self) { audioBook in
                                                    AudioBooksFromPlayList(audioBook: audioBook)
                                                }
                                            }
                                        }
        
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .listRowBackground(Color("fullBackground"))
                                }
                                .listStyle(.plain)
                                .searchable(text: $searchText)
                                .padding(.top, 20)
                                .foregroundColor(.white)
                                .onChange(of: searchText) { value in
                                    Task.init {
                                        if !value.isEmpty && value.count > 3 {
                                            await audioBookViewModel.searchPerGender(gender: searchText)
                                        } else {
                                            audioBookViewModel.audioBookList.removeAll()
                                        }
                                    }

                                }
                                .navigationTitle("Buscar por género")
                         
                            }
                            .background(Color("fullBackground"))
                            .frame(maxWidth: .infinity,maxHeight: .infinity)

                        }
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                        
                        
                    }
                    
                }
                .background(Color("fullBackground"))
                .frame(maxWidth: .infinity,maxHeight: .infinity)
            }
            .background(Color("fullBackground"))
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            
        }
       
    }
  
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct UINavigationConfiguration: UIViewControllerRepresentable {
    var config: (UINavigationController) -> Void = {_ in }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        DispatchQueue.main.async {
            if let nc = controller.navigationController {
                self.config(nc)
            }
        }
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}
