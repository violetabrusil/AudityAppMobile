//
//  AudioBooksFromPlayList.swift
//  Audity (iOS)
//
//  Created by Violeta on 12/8/22.
//

import SwiftUI

struct AudioBooksFromPlayList: View {
    
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
                
                HStack{
                    
                    AsyncImage(url: URL(string: audioBook.urlImage)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                    VStack{
                        Text(audioBook.titleAudioBook)
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .heavy, design: .default))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        Text(audioBook.author)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        Text(audioBook.gender)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        Text(audioBook.yearOfPublication)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                    }
                }
                
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color("fullBackground"))
            .padding(.leading,20)
            .padding(.top,25)
            
        }
    }
}

struct AudioBooksFromPlayList_Previews: PreviewProvider {
    static var previews: some View {
        AudioBooksFromPlayList(audioBook: AudioBook())
    }
}
