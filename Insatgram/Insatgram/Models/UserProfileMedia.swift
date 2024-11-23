//
//  UserMedia.swift
//  Insatgram
//
//  Created by Apple on 23.11.24.
//


import Foundation

struct UserProfileMedia: Codable {
    let id: String
    let lowResolutionImage: Image

    enum CodingKeys: String, CodingKey {
        case id
        case images
    }

    enum ImagesKeys: String, CodingKey {
        case lowResolution = "low_resolution"
    }

    struct Image: Codable {
        let url: String
        let width: Int
        let height: Int
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        
        let imagesContainer = try container.nestedContainer(keyedBy: ImagesKeys.self, forKey: .images)
        lowResolutionImage = try imagesContainer.decode(Image.self, forKey: .lowResolution)
    }
}
