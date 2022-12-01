//
//  ReviewViewModel.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 9/12/22.
//

import Foundation

enum APIError: Error{
    case responseProblem
    case decodingProblem
    case ecodingProblem
}

class ReviewViewModel: ObservableObject {
    
    @Published var review = [Review]()
    let prefixUrl = "http://localhost:8080/api/audioBook"
    
    func addReview(idAudioBook: String, parameters: [String: Any]){
        guard let url = URL(string: "\(prefixUrl)/addReview/\(idAudioBook)") else {
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
                    let result = try JSONDecoder().decode(AudioBook.self, from: data)
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
