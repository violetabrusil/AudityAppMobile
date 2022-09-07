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

class AudioBookViewModel: ObservableObject {
    
    @Published var audioBookList: [AudioBook] = []
    @Published var audioBookSearchList: [AudioBook] = []
    
    func fetch() {
        guard let url = URL(string: "http://localhost:8080/api/audioBook/getAllAudioBooks") else {
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
    
    func searchAudioBooks(wordToSearch: String) async throws -> [AudioBook] {
        
        let searchType: String = "SEARCH_PER_TITLE"
        
        guard let url = URL(string: "http://localhost:8080/api/audioBook/searchByAuthor/\(searchType)/\(wordToSearch)") else {
            print("no hay respuesta")
            throw Network.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw Network.badID
        }
        
        
        let audioBookResponse = try? JSONDecoder().decode([AudioBook].self, from: data)
        return audioBookResponse ?? []
        
        
        
        
        
        //        var components = URLComponents()
        //        components.scheme = "http"
        //        components.host = "localhost:8080/api/audioBook/searchByAuthor/\(searchType)/\(wordToSearch)"
        ////        components.queryItems = [
        ////            URLQueryItem(name: "typeSearch", value: "SEARCH_PER_TITLE"),
        ////            URLQueryItem(name: "wordToSearch", value: wordToSearch)
        ////        ]
        //
        //        guard let url = components.url else {
        //            throw Network.badURL
        //        }
        //
        //        let (data, response) = try await URLSession.shared.data(from: url)
        //
        //        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
        //            throw Network.badID
        //        }
        //
        //        let audioBookResponse = try? JSONDecoder().decode(AudioBookResponse.self, from: data)
        //        return audioBookResponse?.audioBooks ?? []
        
        
        
        
    }
    
}
