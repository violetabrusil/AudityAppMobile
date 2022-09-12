//
//  AudioBookInformationView.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 9/5/22.
//

import SwiftUI

struct AudioBookInformationView: View {
    
    @State private var showPlayer = false
    let audityViewModel = AudityBaseViewModel()
    
    let audioBook: AudioBook
    
    public init(audioBook: AudioBook) {
        self.audioBook = audioBook
    }
    
    var body: some View {
        
        VStack(spacing: 0){
            //Image
            
            AsyncImage(url: URL(string: audioBook.urlImage)) { image in
                image.resizable()
                
            } placeholder: {
                ProgressView()
            }
            .scaledToFill()
            .frame(height: UIScreen.main.bounds.height / 3)
            
            //AudioBook Details
            
            ZStack{
                
                Color(red: 24/255, green: 23/255, blue:22/255)
                
                VStack(alignment: .leading, spacing: 24) {
                    
                    //Gender and Duration
                    VStack(alignment: .leading, spacing: 8) {
                        Text(audioBook.gender)
                        Text(audioBook.yearOfPublication)
                        Text("0s")
                        
                    }
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    
                    //Title
                    Text(audioBook.titleAudioBook)
                        .font(.title)
                    
                    //Play Button
                    Button {
                        showPlayer = true
                    } label: {
                        Label("Play", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(20)
                    }
                    
                    
                    //Sipnosis
                    Text(audioBook.sipnosis)
                    
                    Spacer()
                    
                }
                .foregroundColor(.white)
                .padding(20)
            }
            .frame(height: UIScreen.main.bounds.height * 2 / 3)
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showPlayer) {
            ReproductorView(audioBook: self.audioBook)
                .environmentObject(AudioManager())
        }
    }
}

struct AudioBookInformationView_Previews: PreviewProvider {
    static var previews: some View {
        AudioBookInformationView(audioBook: AudioBook())
            .environmentObject(AudioManager())
    }
}
