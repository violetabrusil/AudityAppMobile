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
    
    public init() {
      
        self.idAudioBook = 0
        self.titleAudioBook = "titleAudioBook"
        self.author = "author"
        self.sipnosis = "sipnosis"
        self.urlImage = "urlImage"
        self.urlAudio = "urlAudio"
        self.gender = "gender"
        self.yearOfPublication = "yearOfPublication"
        self.reviews = []
        self.userId = "userId"
    }
}

struct AudioBookResponse: Decodable {
    let audioBooks: [AudioBook]
    
    private enum CodingKeys: String, CodingKey {
        case audioBooks = "SEARCH_PER_TITLE"
    }
}

struct AudioBookResponseA: Decodable {
    let audioBooksPerAuthor: [AudioBook]
    
    private enum CodingKeys: String, CodingKey {
        case audioBooksPerAuthor = "SEARCH_PER_AUTHOR"
    }
}

struct AudioBookResponseG: Decodable {
    let audioBooksPerGender: [AudioBook]
    
    private enum CodingKeys: String, CodingKey {
        case audioBooksPerGender = "SEARCH_PER_GENDER"
    }
}
