//
//  AddToPlayListView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/24/22.
//

import SwiftUI

struct AddToPlayListView: View {
    
    @State private var showNewPlayList = false
    @Environment(\.dismiss) var dismiss
    @StateObject var playListViewModel = PlayListViewModel()
    @EnvironmentObject var user : UserViewModel
    let audioBook: AudioBook
    @State var success = true
    @State var showToast = false
    @State var existingAudiobook = false
    
    public init(audioBook: AudioBook) {
        self.audioBook = audioBook
    }
    
    var body: some View {
        
        VStack(spacing: 10){
            HStack(spacing: 5){
                Button(action: {
                    dismiss()
                }, label: {
                    HStack{
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding()
                            .foregroundColor(Color.white)
                    }
                })
                .padding(.trailing, 20.0)
                
                Text("Añadir a la Lista de Reproducción")
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                    .font(.system(size: 18, weight: .heavy, design: .default))
                
            }
            .padding(.top,20)
            
            Spacer()
            
            
            VStack{
                
                Button(action: {
                    showNewPlayList = true
                }, label: {
                    HStack{
                        Text("Nueva lista")
                            .font(.system(size: 15, weight: .heavy, design: .default))
                    }
                    .padding()
                    
                })
                .frame(width: 150)
                .background(Color("GreenColor"))
                .foregroundColor(Color.white)
                .cornerRadius(20)
            }
            
            VStack{
                ScrollView (.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 13){
                        
                        ForEach(playListViewModel.playList, id:\.self) { playList in
                            Button(action: {
                                let idAudioBooks = playList.idAudioBooks
                                for idAudioBook in idAudioBooks ?? [] {
                                    if Int(idAudioBook.idAudioBook) == audioBook.idAudioBook {
                                        self.existingAudiobook = true
                                        success = false
                                        showToast = true
                                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
                                            showToast = false
                                            dismiss()
                                        }
                                    }
                                }
                                if success {
                                    
                                    let parameters: [String: Any] = ["idAudioBook": audioBook.idAudioBook]
                                    playListViewModel.addAudioBookToPlayList(idPlayList: String(playList.idPlayList), parameters: parameters)
                                    showToast = true
                                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
                                        showToast = false
                                        dismiss()
                                    }
                                    
                                    
                                }
                                
                            }, label: {
                                PlayListView(playList: playList)
                            })
                            
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
        .opacity(30.0)
        .fullScreenCover(isPresented: $showNewPlayList) {
            CreateNewPlayListView()
        }
        .toast(isPresenting: $showToast, message: existingAudiobook ?  "El audiolibro ya se encuentra agregado" : "Audiolibro agregado.", icon: existingAudiobook ? .error : .success)
    }
}

struct AddToPlayListReview_Previews: PreviewProvider {
    static var previews: some View {
        AddToPlayListView(audioBook: AudioBook())
    }
}
