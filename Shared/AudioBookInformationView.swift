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
            //AudioBook Details
            ZStack(alignment: .top){
                Color(red: 24/255, green: 23/255, blue:22/255)
                
                VStack{
                    //Image
                    AsyncImage(url: URL(string: audioBook.urlImage)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .scaledToFill()
                    .frame(height: UIScreen.main.bounds.height / 4)
                    .opacity(0.5)
//                    .padding(.top,20)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        //Gender and yearOfPublication
                        VStack(alignment: .leading, spacing: 8) {
                            Text(audioBook.gender)
                            Text(audioBook.yearOfPublication)
                            
                        }
                        .font(.subheadline)
                        .textCase(.uppercase)
                        .opacity(0.7)
                        
                        //Title
                        Text(audioBook.titleAudioBook)
                            .frame(height: 80)
                            .font(.title)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                        
                        VStack(spacing: 0){
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
                            .padding(.bottom, 10)
                
                            //Sipnosis
                            ScrollView{
                                VStack{
                                    Text(audioBook.sipnosis)
                                        .multilineTextAlignment(.leading)

                                }
                                
                            }
                            .frame(height: 110)
                        }
                        
                        if ((audioBook.reviews?.count) != 0){
                            VStack{
                                ScrollView{
                                    ForEach(0..<audioBook.reviews!.count, id: \.self ) { index in
                                        HStack{
                                            StarsView(rating: .constant(audioBook.reviews![index].rating ?? "0"))
                                            Text(audioBook.reviews![index].comment)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .foregroundColor(Color.white)
                                        }
                                    }
                                }
                            }
                            .frame(height: 100)
                        }
                        else{
                            HStack{
                                Spacer()
                                Text("No hay reviews.")
                                Spacer()
                            }
                            
                        }
                        Spacer()
                        
                    }
                    .frame(height: UIScreen.main.bounds.height * 1 / 5)
                    .foregroundColor(.white)
                    .padding(20)
                    .padding(.top, 280)
                }
                
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
                        .padding(.top, 60)
                    Spacer()
                    
                }
//                .padding(10)
            }
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
