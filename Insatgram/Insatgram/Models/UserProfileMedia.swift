//
//  UserProfileMedia.swift
//  Insatgram
//
//  Created by Apple on 23.11.24.
//

import Foundation

struct UserMediaResponse: Decodable {
    let data: [UserMedia]
}

struct UserMedia: Decodable {
    let id: String
    let images: Images
    
    struct Images: Decodable {
        let lowResolution: ImageResolution
        
        enum CodingKeys: String, CodingKey {
            case lowResolution = "low_resolution"
        }
        
        struct ImageResolution: Decodable {
            let url: String
            let width: Int
            let height: Int
        }
    }
}


