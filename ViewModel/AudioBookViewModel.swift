//
//  AudioBookViewModel.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 9/2/22.
//

import Foundation
import UIKit

class AudioBookViewModel: ObservableObject {
    
    @Published var audioBookList: [AudioBook] = []
     
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
}
