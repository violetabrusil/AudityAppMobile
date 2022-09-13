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

final class ReviewViewModel: ObservableObject {
    
//    @Published var review = Review()
//    
//    let resourceUrl: URL
//    
//    init(idAudioBook: Int) {
//        let resourceString = "http://localhost:8080/api/audioBook/addReview/\(idAudioBook)"
//        guard let resourceUrl = URL(string: resourceString) else { fatalError()}
//        self.resourceUrl = resourceUrl
//    }
//    
//    func addReview (completion: @escaping(Result<Review, APIError>) -> Void) {
//        
//        do {
//            var urlRequest = URLRequest(url: resourceUrl)
//            urlRequest.httpMethod = "POST"
//            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            urlRequest.httpBody = try JSONEncoder().encode(review)
//            
//            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
//                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
//                      let jsonData = data else {
//                          completion(.failure(.responseProblem))
//                          return
//                      }
//                
//                do {
//                    let reviewData = try JSONDecoder().decode(Review.self, from: jsonData)
//                    completion(.success(reviewData))
//                } catch {
//                    completion(.failure(.decodingProblem))
//                }
//            }
//            dataTask.resume()
//        } catch {
//            completion(.failure(.ecodingProblem))
//        }
//    }
}
