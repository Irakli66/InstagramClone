//
//  LikesPageViewModel.swift
//  Insatgram
//
//  Created by irakli kharshiladze on 22.11.24.
//

import UIKit

final class LikesPageViewModel {
    struct LikeItem {
        let profileImageName: String
        let message: String
        let postImageName: String?
    }

    let sections = [
        ("New", [
            LikeItem(profileImageName: "test1", message: "karennne liked your photo. 1h", postImageName: "test2")
        ]),
        ("Today", [
            LikeItem(profileImageName: "test3", message: "kiero_d, zackjohn and 26 others liked your photo. 3h", postImageName: "test4")
        ]),
        ("This Week", [
            LikeItem(profileImageName: "test5", message: "craig_love mentioned you in a comment: @jacob_w exactly..", postImageName: "test6"),
            LikeItem(profileImageName: "test7", message: "martini_rond started following you. 3d", postImageName: nil),
            LikeItem(profileImageName: "test8", message: "maxjacobson started following you. 3d", postImageName: nil),
            LikeItem(profileImageName: "test9", message: "mis_potter started following you. 3d", postImageName: nil)
        ]),
        ("This Month", [
            LikeItem(profileImageName: "test10", message: "m_humphrey started following you. 3d", postImageName: nil)
        ])
    ]
}
