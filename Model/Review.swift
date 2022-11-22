//
//  Review.swift
//  AudityAppMobile (iOS)
//
//  Created by Violeta on 9/2/22.
//

import Foundation

struct Review: Hashable, Codable {
    
    var idReview: Int = 0
    var audiobook: String? = ""
    var userId: String = ""
    var comment: String = ""
    var rating: String? = ""

    
}

    
