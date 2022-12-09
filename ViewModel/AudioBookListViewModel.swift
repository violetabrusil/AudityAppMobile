//
//  AudioBookListViewModel.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 9/6/22.
//

import Foundation

@MainActor
class AudioBookListViewModel: ObservableObject {
    
    @Published var audioBooks: [AudioBook] = []
    let audioBookModel: AudioBookViewModel = AudioBookViewModel()
    
    func search(title: String) async {
        do {
            let audioBooks = try await audioBookModel.searchAudioBooks(wordToSearch: title)
            self.audioBooks = audioBooks
        } catch {
            print(error)
        }
        
    }
    
    func searchPerAuhor(author: String) async {
        do {
            let audioBooks = try await audioBookModel.searchAudioBookPerAuthor(wordToSearch: author)
            self.audioBooks = audioBooks
        } catch {
            print(error)
        }
        
    }
    
    func searchPerGender(gender: String) async {
        do {
            let audioBooks = try await audioBookModel.searchAudioBookPerGender(wordToSearch: gender)
            self.audioBooks = audioBooks
        } catch {
            print(error)
        }
        
    }
}

//struct AudioBookModel {
//
//    let audioBook: AudioBook
//
//    var idAudioBook: Int {
//        audioBook.idAudioBook
//    }
//
//    var titleAudioBook: String {
//        audioBook.titleAudioBook
//    }
//
//    var author: String {
//        audioBook.author
//    }
//
//    var sipnosis: String {
//        audioBook.sipnosis
//    }
//
//    var image: URL? {
//        URL(string: audioBook.urlImage)
//    }
//
//    var year: String {
//        audioBook.yearOfPublication
//    }
//
//    var gender: String {
//        audioBook.gender
//    }
//
//
//
//}
