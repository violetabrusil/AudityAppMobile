//
//  AudioBookViewModel.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 9/2/22.
//

import Foundation
import UIKit

enum Network: Error {
    case badURL
    case badID
}

let BASEURL = "http://localhost:8080"

class AudioBookViewModel: ObservableObject {
    
    @Published var audioBookList: [AudioBook] = []
    
    func fetch() {
        let endpoint = "/api/audioBook/getAllAudioBooks"
        guard let url = URL(string: BASEURL + endpoint) else {
            print("no hay respuesta")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //            Convert to JSON
            
            do {
                let audioBooks = try JSONDecoder().decode([AudioBook].self, from: data)
                
//                for audioBook in audioBooks {
//                    let reviews = audioBook.reviews
//                    
//                }
                DispatchQueue.main.async {
                    self.audioBookList = audioBooks
                }
                
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    func searchAudioBookPerTitle(wordToSearch: String) async throws -> [AudioBook] {
        
        let searchType: String = "SEARCH_PER_TITLE"
        var components = URLComponents()
        components.scheme = "http"
        components.host = "localhost"
        components.port = 8080
        components.path = "/api/audioBook/searchByAuthor/\(searchType)/\(wordToSearch)"
        
        guard let url = components.url else {
            print("no hay respuesta")
            throw Network.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw Network.badID
        }
        
        
        let audioBookResponse = try? JSONDecoder().decode([AudioBook].self, from: data)
        return audioBookResponse ?? []
      
    }
    
    func searchAudioBookPerAuthor(wordToSearch: String) async throws -> [AudioBook] {
        
        let searchType: String = "SEARCH_PER_AUTHOR"
        var components = URLComponents()
        components.scheme = "http"
        components.host = "localhost"
        components.port = 8080
        components.path = "/api/audioBook/searchByAuthor/\(searchType)/\(wordToSearch)"
        
        guard let url = components.url else {
            print("no hay respuesta")
            throw Network.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw Network.badID
        }
        
        
        let audioBookResponse = try? JSONDecoder().decode([AudioBook].self, from: data)
        return audioBookResponse ?? []
      
    }
    
    func searchAudioBookPerGender(wordToSearch: String) async throws -> [AudioBook] {
        
        let searchType: String = "SEARCH_PER_GENDER"
        var components = URLComponents()
        components.scheme = "http"
        components.host = "localhost"
        components.port = 8080
        components.path = "/api/audioBook/searchByAuthor/\(searchType)/\(wordToSearch)"
        
        guard let url = components.url else {
            print("no hay respuesta")
            throw Network.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw Network.badID
        }
        
        
        let audioBookResponse = try? JSONDecoder().decode([AudioBook].self, from: data)
        return audioBookResponse ?? []
      
    }
    
    func searchPerTitle(title: String) async {
        do {
            let audioBooks = try await searchAudioBookPerTitle(wordToSearch: title)
            self.audioBookList = audioBooks
        } catch {
            self.audioBookList = []
            print(error)
        }

    }

    func searchPerAuhor(author: String) async {
        do {
             let audioBooks = try await searchAudioBookPerAuthor(wordToSearch: author)
            self.audioBookList = audioBooks
        } catch {
            self.audioBookList = []
            print(error)
        }

    }

    func searchPerGender(gender: String) async {
        do {
            let audioBooks = try await searchAudioBookPerGender(wordToSearch: gender)
            self.audioBookList = audioBooks
        } catch {
            self.audioBookList = []
            print(error)
        }

    }
    
    func getAudioBooksFromPlayList(wordToSearch: String) {
        
        let endpoint = "api/audioBook/getAudioBooksFromPlayList/\(wordToSearch)"
        guard let url = URL(string: BASEURL + endpoint) else {
            print("no hay respuesta")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //            Convert to JSON
            
            do {
                let audioBooks = try JSONDecoder().decode([AudioBook].self, from: data)
                
                DispatchQueue.main.async {
                    self.audioBookList = audioBooks
                }
                
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    
    
}
