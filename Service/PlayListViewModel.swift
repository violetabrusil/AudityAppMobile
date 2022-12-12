//
//  PlayListViewModel.swift
//  Audity (iOS)
//
//  Created by Violeta on 11/25/22.
//

import Foundation
import UIKit

enum UrlError: Error{
    case responseProblem
    case decodingProblem
    case ecodingProblem
}

class PlayListViewModel: ObservableObject {
    
    @Published var playList: [PlayList] = []
    let prefixUrl = "http://localhost:9090/api/playList"
    @Published var idAudioBooksStringArray = ""
    
    func createPlayList(parameters: [String: Any]){
        guard let url = URL(string: "\(prefixUrl)/createPlayList") else {
            print("Not found url")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil {
                print("Error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(PlayList.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else {
                    print("No data")
                }
            } catch let JsonError {
                print("Json error", JsonError.localizedDescription)
            }
        }.resume()
  
    }
    
    func searchPlayListPerUser(wordToSearch: String) {
        
        let searchType: String = "SEARCH_PER_USER"
        let endpoint = "/searchByNamePlayList/\(searchType)/\(wordToSearch)"
        guard let url = URL(string: prefixUrl + endpoint) else {
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
                let playLists = try JSONDecoder().decode([PlayList].self, from: data)
                
                DispatchQueue.main.async {
                    self.playList = playLists
                }
                
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    func addAudioBookToPlayList(idPlayList: String, parameters: [String: Any]){
        guard let url = URL(string: "\(prefixUrl)/addAudioBookToPlayList/\(idPlayList)") else {
            print("Not found url")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil {
                print("Error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(PlayList.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else {
                    print("No data")
                }
            } catch let JsonError {
                print("Json error", JsonError.localizedDescription)
            }
        }.resume()
  
    }
    
     func searchAudioBooks(wordToSearch: String) {

        let endpoint = "/searchAudioBooks/\(wordToSearch)"
        guard let url = URL(string: prefixUrl + endpoint) else {
            print("no hay respuesta")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
                        
            do {
                self.idAudioBooksStringArray = String(data: data, encoding: .utf8) ?? ""

            }
            catch {
                print(error)
            }
            
        }
        task.resume()
        
    }
    
    
    
    
}
