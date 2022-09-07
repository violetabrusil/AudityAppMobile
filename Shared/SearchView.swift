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
    
    var body: some View {
        
        NavigationView{
            VStack{
                
    //            VStack{
    //
    ////                Text("Buscar")
    ////                    .multilineTextAlignment(.leading)
    ////                    .foregroundColor(Color.white)
    ////                    .font(.system(size: 25, weight: .heavy, design: .default))
    ////
    ////                HStack(spacing:1){
    ////                    Image(systemName: "magnifyingglass")
    ////                        .resizable()
    ////                        .frame(width: 20, height: 20)
    ////                        .padding()
    ////
    ////                    TextField("Autores o títulos", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
    ////                }
    ////                .frame(width: 370,height:40)
    ////                .background()
    ////                .cornerRadius(10)
    //
    //
    //
    //            }
                
                List(audioBookListVM.audioBooks, id: \.idAudioBook) { audioBook in
                    Text(audioBook.titleAudioBook)
                   
                }.listStyle(.plain)
                    .searchable(text: $searchText)
                    .onChange(of: searchText) { value in
                        async {
                            if !value.isEmpty && value.count > 3 {
                                await audioBookListVM.search(title: value)
                            } else {
                                audioBookListVM.audioBooks.removeAll()
                            }
                        }
                       
                    }
                    .navigationTitle("Buscar")
                
    //            VStack{
    //
    //                Text("Géneros")
    //                    .multilineTextAlignment(.leading)
    //                    .padding(.leading, 5)
    //                    .foregroundColor(Color.white)
    //                    .font(.system(size: 20, weight: .heavy, design: .default))
    //
    //            }
    //
    //            Spacer()
                
            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color(.black))
        }
        
       
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
