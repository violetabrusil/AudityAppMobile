//
//  AudioBookView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI

struct AudioBookView: View {
    
    let audioBook: AudioBook
    
    public init(audioBook: AudioBook) {
        self.audioBook = audioBook
    }
    
    var body: some View {
        
        
        VStack{
            AsyncImage(url: URL(string: audioBook.urlImage)) { image in
                image.resizable()
                
            } placeholder: {
                ProgressView()
            }
            .frame(width: 153, height: 163)
            
            Text(audioBook.titleAudioBook)
                .foregroundColor(Color.white)
            
            Text(audioBook.author)
                .foregroundColor(Color.white)
        }
        .frame(width: 153)
    
    }
}

struct AudioBookView_Previews: PreviewProvider {
    static var previews: some View {
        AudioBookView(audioBook: AudioBook(idAudioBook: 1, titleAudioBook: "", author: "", sipnosis: "", urlImage: "", urlAudio: "", gender: "", yearOfPublication: "", reviews: [], userId: ""))
    }
}
