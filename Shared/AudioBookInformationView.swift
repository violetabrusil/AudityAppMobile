//
//  AudioBookInformationView.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 9/5/22.
//

import SwiftUI

struct AudioBookInformationView: View {
    
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
            .scaledToFill()
            .frame(height: UIScreen.main.bounds.height / 3)
        }
    }
}

struct AudioBookInformationView_Previews: PreviewProvider {
    static var previews: some View {
        AudioBookInformationView(audioBook: AudioBook(idAudioBook: 1, titleAudioBook: "", author: "", sipnosis: "", urlImage: "", urlAudio: "", gender: "", yearOfPublication: "", reviews: [], userId: ""))
    }
}
