//
//  UserFeedModel.swift
//  Insatgram
//
//  Created by irakli kharshiladze on 22.11.24.
//

import Foundation

struct PostResponse: Decodable {
    let data: [Post]
    let meta: FeedMeta?
}

struct Post: Decodable {
    let caption: Caption?
    let createdTime: String
    let id: String
    let images: [Image]
    let likes: Likes
    let link: String
    let location: Location?
    let user: UserMain
    var userHasLiked: Bool
    let usersInPhoto: [UserInPhoto]?

    enum CodingKeys: String, CodingKey {
        case caption
        case createdTime = "created_time"
        case id
        case images
        case likes
        case link
        case location
        case user
        case userHasLiked = "user_has_liked"
        case usersInPhoto = "users_in_photo"
    }
}

struct Caption: Decodable {
    let createdTime: String
    let from: UserMain
    let id: String
    let text: String

    enum CodingKeys: String, CodingKey {
        case createdTime = "created_time"
        case from
        case id
        case text
    }
}

struct Image: Decodable {
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
    }
}

struct Likes: Decodable {
    let count: Int
    let data: [UserMain]
}

struct Location: Decodable {
    let id: String
    let latitude: Double
    let longitude: Double
    let name: String
}

struct UserMain: Decodable {
    let fullName: String
    let id: String
    let profilePicture: String
    let username: String

    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case id
        case profilePicture = "profile_picture"
        case username
    }
}

struct UserInPhoto: Decodable {
    let position: Position
    let user: UserMain
}

struct Position: Decodable {
    let x: Double
    let y: Double
}

struct FeedMeta: Decodable {
    let code: Int
}

