//
//  ReproductorView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI
import GoogleSignInSwift
import Firebase
import FirebaseStorage

struct ReproductorView: View {
    
    let audioBook: AudioBook
    var isPreview: Bool = false
    
    public init(audioBook: AudioBook) {
        self.audioBook = audioBook
    }
    
    @State private var value: Double = 0.0
    @State private var isEditing: Bool = false
    @State private var showMoreInformation = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var audioManager: AudioManager
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    let audityViewModel = AudityBaseViewModel()
    
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
                .opacity(0.80)
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
                                .foregroundColor(Color.white)
                        }
                    })
                    
                    Text(audioBook.gender)
                        .frame(width: 80, alignment: .center)
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .heavy, design: .default))
                    
                    Button(action: {
                       
                        showMoreInformation = true
                    }, label: {
                        HStack{
                            Image(systemName: "ellipsis")
                                .resizable()
                                .frame(width: 15, height: 5)
                                .padding()
                                .foregroundColor(Color.white)
                        }
                    })
                    
                }
                
                //Title
                Text(audioBook.titleAudioBook)
                    .font(.title)
                    .foregroundColor(Color.white)
                
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
                            Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? ":0:00")
                                .foregroundColor(Color.white)
                            
                            Spacer()
                            
                            Text(DateComponentsFormatter.positional.string(from: player.duration - player.currentTime) ?? ":0:00")
                                .foregroundColor(Color.white)
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
                        PlaybackControlButton(systemName: "gobackward.10", color: Color.white) {
                            player.currentTime -= 10
                        }
                        
                        Spacer()
                        
                        //Play/Pause button
                        PlaybackControlButton(systemName: audioManager.isPlaying
                                              ? "pause.circle.fill" : "play.circle.fill",
                                              fontSize: 44, color: Color.white) {
                            audioManager.playPause()
                        }
                        
                        Spacer()
                        
                        //Backward button
                        PlaybackControlButton(systemName: "goforward.10", color: Color.white) {
                            player.currentTime += 10
                        }
                        
                        Spacer()
                        
                        //Stop button
                        PlaybackControlButton(systemName: "stop.fill", color: Color.white) {
                            audioManager.stop()
                            dismiss()
                        }
                    }
                }
                
            }
            .padding(20)
        }
        .onAppear {
            audioManager.startPlayer(track: audioBook.urlAudio, isPreview: isPreview)
        }
        .onReceive(timer) { _ in
            guard let player = audioManager.player, !isEditing else { return }
            value = player.currentTime
            
        }
        .fullScreenCover(isPresented: $showMoreInformation) {
            MoreInformationView(audioBook: audioBook)
        }
    }
    
    struct ReproductorView_Previews: PreviewProvider {
        static var previews: some View {
            ReproductorView(audioBook: AudioBook())
        }
    }
}

