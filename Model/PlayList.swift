//
//  PlayList.swift
//  Audity (iOS)
//
//  Created by Violeta on 11/25/22.
//

import Foundation

struct PlayList: Hashable, Codable {
    
    let idPlayList: Int
    let namePlayList: String
    let userId: String
    let audioBooks: [AudioBook]?

    public init() {
      
        self.idPlayList = 0
        self.namePlayList = "namePlayList"
        self.userId = "userId"
        self.audioBooks = []
        
    }
}
