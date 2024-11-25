//
//  UserModel.swift
//  Insatgram
//
//  Created by irakli kharshiladze on 22.11.24.
//

import Foundation

struct UserResponse: Decodable {
    let data: User
}

struct User: Decodable {
    let id: String
    let username: String
    let bio: String
    let counts: Counts
    let fullName: String
    let profilePicture: String
    
    struct Counts: Decodable {
        let followedBy: Int
        let follows: Int
        let media: Int
        
        
        enum CodingKeys: String, CodingKey {
            case followedBy = "followed_by"
            case follows
            case media
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case profilePicture = "profile_picture"
        case username
        case bio
        case counts
    }
}



