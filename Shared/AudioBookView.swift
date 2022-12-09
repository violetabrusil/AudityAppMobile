//
//  AudioBookView.swift
//  AudityAppMobile
//
//  Created by Violeta on 8/22/22.
//

import SwiftUI

struct AudioBookView: View {
    
    let audioBook: AudioBook
    let audityViewModel = AudityBaseViewModel()
    
    public init(audioBook: AudioBook) {
        self.audioBook = audioBook
    }
    
    var body: some View {
        
        Button {
            _ = audityViewModel.extras.set(key: "audioBook", value: audioBook)
            audityViewModel.nextScreenType = NeutralScreenType.AudioBookInformationView.rawValue
            audityViewModel.goToNextScreen = true
        } label: {
            
            VStack{
    
                AsyncImage(url: URL(string: audioBook.urlImage)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 200)
                    
                } placeholder: {
                    ProgressView()
                }
               
                VStack{
                    Text(audioBook.titleAudioBook)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.white)
                    
                    Text(audioBook.author)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.white)
                }
                .padding(.top,15)
                
               
            }
            .frame(width: 150)
            .padding(.leading,20)
        }
        
       
    
    }
}

struct AudioBookView_Previews: PreviewProvider {
    static var previews: some View {
        AudioBookView(audioBook: AudioBook())
    }
}
