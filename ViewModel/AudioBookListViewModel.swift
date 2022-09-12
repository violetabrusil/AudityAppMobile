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
    
    func searchPerAuhor(author: String) async {
        do {
            let audioBooks = try await AudioBookViewModel().searchAudioBookPerAuthor(wordToSearch: author)
            self.audioBooks = audioBooks.map(AudioBookModel.init)
        } catch {
            print(error)
        }
        
    }
    
    func searchPerGender(gender: String) async {
        do {
            let audioBooks = try await AudioBookViewModel().searchAudioBookPerGender(wordToSearch: gender)
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
    
    var year: String {
        audioBook.yearOfPublication
    }
    
    var gender: String {
        audioBook.gender
    }
    
    
    
}