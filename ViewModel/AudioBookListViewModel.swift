//
//  AudioBookListViewModel.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 9/6/22.
//

import Foundation

@MainActor
class AudioBookListViewModel: ObservableObject {
    
    @Published var audioBooks: [AudioBookModel] = []
    
    func search(title: String) async {
        do {
            let audioBooks = try await AudioBookViewModel().searchAudioBooks(wordToSearch: title)
            self.audioBooks = audioBooks.map(AudioBookModel.init)
        } catch {
            print(error)
        }
        
    }
}

struct AudioBookModel {
    
    let audioBook: AudioBook
    
    var idAudioBook: Int {
        audioBook.idAudioBook
    }
    
    var titleAudioBook: String {
        audioBook.titleAudioBook
    }
    
    var author: String {
        audioBook.author
    }
    
    var image: URL? {
        URL(string: audioBook.urlImage)
    }
    
    
}
