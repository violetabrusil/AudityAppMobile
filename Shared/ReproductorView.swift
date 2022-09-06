//
//  ReproductorView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI
import GoogleSignInSwift

struct ReproductorView: View {
    
    let audioBook: AudioBook
    var isPreview: Bool = false
    
    public init(audioBook: AudioBook) {
        self.audioBook = audioBook
    }
    
    @State private var value: Double = 0.0
    @State private var isEditing: Bool = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var audioManager: AudioManager
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        
        ZStack{
            
            //Background Image
            
            AsyncImage(url: URL(string: audioBook.urlImage)) { image in
                image.resizable()
                
            } placeholder: {
                ProgressView()
            }
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width)
            .ignoresSafeArea()
            
            //Blur View
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            //ToolBar
            
            VStack{
                
                HStack(spacing:110){
                    Button(action: {
                        audioManager.stop()
                        dismiss()
                    }, label: {
                        HStack{
                            Image(systemName: "chevron.down")
                                .resizable()
                                .frame(width: 15, height: 10)
                                .padding()
                                .foregroundColor(Color.black)
                        }
                    })
                    
                    Text(audioBook.gender)
                        .frame(width: 80)
                        .multilineTextAlignment(.center)
                        .padding(.leading, 5)
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .heavy, design: .default))
                    
                    Button(action: {
                        print("More information")
                    }, label: {
                        HStack{
                            Image(systemName: "ellipsis")
                                .resizable()
                                .frame(width: 15, height: 5)
                                .padding()
                                .foregroundColor(Color.black)
                        }
                    })
                    
                }
                
                //Title
                Text(audioBook.titleAudioBook)
                    .font(.title)
                    .foregroundColor(.black)
                
                Spacer()
                
                //Playback
                if let player = audioManager.player {
                    VStack(spacing:5){
                        
                        //Playback timeline
                        Slider(value: $value, in: 0...player.duration) { editing in
                            
                            print("editing", editing)
                            isEditing = editing
                            
                            if !editing {
                                player.currentTime = value
                            }
                            
                        }
                        .accentColor(.green)
                        
                        HStack{
                            Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "0:00")
                            
                            Spacer()
                            
                            Text(DateComponentsFormatter.positional.string(from: player.duration - player.currentTime) ?? "0:00")
                        }
                        .font(.caption)
                        .foregroundColor(.black)
                        
                    }
                    
                    //PLayback Controls
                    HStack{
                        
                        //Backward button
                        let color: Color = audioManager.isLooping ? .teal : .white
                        PlaybackControlButton(systemName: "repeat", color: color) {
                            audioManager.toggleLoop()
                        }
                        
                        Spacer()
                        
                        //Backward button
                        PlaybackControlButton(systemName: "gobackward.10") {
                            player.currentTime -= 10
                        }
                        
                        Spacer()
                        
                        //Play/Pause button
                        PlaybackControlButton(systemName: audioManager.isPlaying
                                              ? "pause.circle.fill" : "play.circle.fill",
                                              fontSize: 44) {
                            audioManager.playPause()
                        }
                        
                        Spacer()
                        
                        //Backward button
                        PlaybackControlButton(systemName: "goforward.10") {
                            player.currentTime += 10
                        }
                        
                        Spacer()
                        
                        //Stop button
                        PlaybackControlButton(systemName: "stop.fill") {
                            audioManager.stop()
                            dismiss()
                        }
                    }
                }
                
            }
            .padding(20)
        }
        .onAppear {
            //            AudioManager.shared.startPlayer(track: audioBook.urlAudio, isPreview: isPreview)
            audioManager.startPlayer(track: audioBook.urlAudio, isPreview: isPreview)
        }
        .onReceive(timer) { _ in
            guard let player = audioManager.player, !isEditing else { return }
            value = player.currentTime
            
        }
    }
    
    struct ReproductorView_Previews: PreviewProvider {
        static var previews: some View {
            ReproductorView(audioBook: AudioBook(idAudioBook: 1, titleAudioBook: "", author: "", sipnosis: "", urlImage: "", urlAudio: "", gender: "", yearOfPublication: "", reviews: [], userId: ""))
                .environmentObject(AudioManager())
        }
    }
}

