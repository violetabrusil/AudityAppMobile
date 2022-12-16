//
//  PlaylistInformationView.swift
//  Audity (iOS)
//
//  Created by Violeta on 12/8/22.
//

import SwiftUI

struct PlaylistInformationView: View {
    
    @StateObject var audioBookViewModel = AudioBookViewModel()
    @StateObject var playListViewModel = PlayListViewModel()
    let playList: PlayList
    let audityViewModel = AudityBaseViewModel()
    
    public init (playList: PlayList) {
        self.playList = playList
    }
    
    var body: some View {
        VStack{
            HStack(spacing: 20){
                HStack{
                    Button(action: {
                        audityViewModel.navigateToPreviousScreen()
                    }, label: {
                        HStack{
                            Image(systemName: "arrow.left")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(.leading, 20.0)
                                .foregroundColor(Color.white)
                        }
                    })
                    .padding(.top, 20)
                }
               
//                Spacer()
       
                HStack{
                    Text(playList.namePlayList.uppercased())
                        .foregroundColor(Color.white)
                        .font(.system(size: 23, weight: .heavy, design: .default))
                    
                }
                .padding(.top,20)
              Spacer()
               
            }
  
            Spacer()
            
            VStack {
               
                if playList.idAudioBooks != nil {
                    ScrollView (.vertical, showsIndicators: false) {
                        
                        VStack(spacing: 13){
                            ForEach(audioBookViewModel.audioBookList, id:\.self) { audioBook in
                                AudioBooksFromPlayList(audioBook: audioBook)
                            }
                        }
                    }
                   
                } else {
                    Text("No existen audiolibros agregados")
                        .foregroundColor(Color.white)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.top,20)
            Spacer()
        
           
        }
        .onAppear() {
            playListViewModel.searchAudioBooks(wordToSearch: String(playList.idPlayList))
        }
        .onChange(of: playListViewModel.idAudioBooksStringArray) { _ in 
            if  playListViewModel.idAudioBooksStringArray == "" {
                
            } else {
                audioBookViewModel.getAudioBooksFromPlayList(wordToSearch: playListViewModel.idAudioBooksStringArray)
            }
        }
        .padding(.top,20)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("fullBackground"))
    }
}

struct PlaylistInformationView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistInformationView(playList: PlayList())
    }
}

