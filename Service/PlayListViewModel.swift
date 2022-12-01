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
    
    @Published var playlist = [PlayList]()
    let prefixUrl = "http://localhost:9090/api/playList"
    
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
    
    
  
}
