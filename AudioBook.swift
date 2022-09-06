//
//  AudioBook.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 9/2/22.
//

import Foundation

struct AudioBook: Hashable, Codable {
    
    let idAudioBook: Int
    let titleAudioBook: String
    let author: String
    let sipnosis: String
    let urlImage: String
    let urlAudio: String
    let gender: String
    let yearOfPublication: String
    let reviews: [Review]?
    let userId: String?

}