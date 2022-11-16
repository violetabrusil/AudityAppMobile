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
//                            .aspectRatio(contentMode: .fit)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .scaledToFill()
                    .frame(height: UIScreen.main.bounds.height / 3)
                    
                    VStack(alignment: .leading, spacing: 24) {
                        
                        //Gender and Duration
                        VStack(alignment: .leading, spacing: 8) {
                            Text(audioBook.gender)
                            Text(audioBook.yearOfPublication)
                            
                        }
                        .font(.subheadline)
                        .textCase(.uppercase)
                        .opacity(0.7)
                        
                        //Title
                        Text(audioBook.titleAudioBook)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
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
                      
                        
                        if ((audioBook.reviews?.count) != nil){
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
                        }
                        else{
                            Text("No hay reviews.")
                        }
                     
                        Spacer()
                        
                    }
                    .frame(height: UIScreen.main.bounds.height * 1 / 5)
                    .foregroundColor(.white)
                    .padding(20)
                    .padding(.top, 200)
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
