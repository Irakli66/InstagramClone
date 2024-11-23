//
//  LikesPageViewModel.swift
//  Insatgram
//
//  Created by irakli kharshiladze on 22.11.24.
//

import Foundation

final class LikesPageViewModel {
    struct LikeItem {
        let profileImageName: String
        let message: String
        let postImageName: String?
    }

    private(set) var sections: [(String, [LikeItem])] = []

    func fetchLikes(completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "http://localhost:3000/v1/users/self/requested-by") else {
            completion(false)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(false)
                return
            }

            do {
                let response = try JSONDecoder().decode(UserLikesResponse.self, from: data)
                
                let newItems = response.data.prefix(2).map {
                    LikeItem(profileImageName: $0.profileImageName, message: $0.message, postImageName: $0.postImageName)
                }
                let todayItems = response.data.dropFirst(2).prefix(2).map {
                    LikeItem(profileImageName: $0.profileImageName, message: $0.message, postImageName: $0.postImageName)
                }
                
                let thisWeekItems = response.data.dropFirst(4).prefix(3).map {
                    LikeItem(profileImageName: $0.profileImageName, message: $0.message, postImageName: $0.postImageName)
                }
                
                let thisMonthItems = response.data.dropFirst(7).prefix(1).map {
                    LikeItem(profileImageName: $0.profileImageName, message: $0.message, postImageName: $0.postImageName)
                }
                
                self.sections = [
                    ("New", newItems),
                    ("Today", todayItems),
                    ("This Week", thisWeekItems),
                    ("This Month", thisMonthItems)
                ]
                
                completion(true)
            } catch {
                print("Decoding Error: \(error)")
                completion(false)
            }
        }.resume()
    }
}
