//
//  UserLikesModel.swift
//  Insatgram
//
//  Created by Levan Gorjeladze on 23.11.24.
//

import Foundation

struct UserLike: Decodable {
    let profileImageName: String
    let message: String
    let postImageName: String?
}

struct UserLikesResponse: Decodable {
    let data: [UserLike]
    let meta: MetaData
}

struct MetaData: Decodable {
    let code: Int
}
