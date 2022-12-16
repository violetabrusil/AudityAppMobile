//
//  MoreInformationView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/23/22.
//

import SwiftUI

struct MoreInformationView: View {
    
    @State private var showAddToPlayList = false
    @State private var showReview = false
    @Environment(\.dismiss) var dismiss
    
    let audioBook: AudioBook
    
    public init(audioBook: AudioBook) {
        self.audioBook = audioBook
    }
    var body: some View {
        
        ZStack{
        
            VStack(spacing: 50){
                
                HStack{
                    Button(action: {
                        dismiss()
                    }, label: {
                        HStack{
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .padding()
                                .foregroundColor(Color.white)
                        }
                    })
                }
                .padding(.leading, 300.0)
                .padding(.top,20)
                
                
                VStack(spacing: 5){
                    
                    AsyncImage(url: URL(string: audioBook.urlImage)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 200, height: 250)
                    .rotation3DEffect(Angle(degrees: 10), axis: (x: 0, y: -30, z: 0))
                    .offset(x: -30)
                    
                    Spacer()
                    
                    VStack{
                        Text(audioBook.titleAudioBook)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(Color.white)
                            .font(.system(size: 18, weight: .heavy, design: .default))
                        
                        
                        Text(audioBook.author)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(Color.white)
                            .font(.subheadline)
                            .opacity(0.7)
                        
                        
                        Text(audioBook.gender)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(Color.white)
                            .font(.subheadline)
                            .opacity(0.7)
                        
                    }
                    .padding(.top, 60)
                    
                    Spacer()
                    
                    
                }
                
                
                VStack{
                    
                    Button(action: {
                        showAddToPlayList = true
                    }, label: {
                        HStack(spacing:20){
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 30, height: 30)
                            
                            Text("Añadir a lista de reproducción")
                                .font(.system(size: 20, weight: .heavy, design: .default))
                        }
                        .padding()
                        
                    })
                        .frame(width: 400)
                        .foregroundColor(Color.white)
                    
                    Button(action: {
                        showReview = true

                    }, label: {
                        HStack(spacing:25){
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                            
                            Text("Reseña")
                                .font(.system(size: 20, weight: .heavy, design: .default))
                            
                        }
                        .padding()
                        
                    })
                        .padding(.trailing, 220.0)
                        .foregroundColor(Color.white)
                }
                .padding(.bottom, 160)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            .fullScreenCover(isPresented: $showAddToPlayList) {
                AddToPlayListView(audioBook: audioBook)
            }
            .fullScreenCover(isPresented: $showReview) {
                ReviewView(audioBook: audioBook)
            }
            
        }
        .background(Color("fullBackground"))
        
        
       
      
        
        
        
        
        
        
        
    }
}



struct MoreInformationView_Previews: PreviewProvider {
    static var previews: some View {
        MoreInformationView(audioBook: AudioBook())
    }
}


