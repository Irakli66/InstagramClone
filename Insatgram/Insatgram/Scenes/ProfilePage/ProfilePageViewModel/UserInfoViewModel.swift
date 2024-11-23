//
//  ProfilePageViewModel.swift
//  Insatgram
//
//  Created by irakli kharshiladze on 22.11.24.
//

import UIKit
import NetworkPackage



final class ProfilePageViewModel {
    
    private let networkService: NetworkServiceProtocol
    
    private var user: User?
    
    private let userId = "1"
    private var urlString: String {
        return "http://localhost:3000/v1/users/\(userId)"
    }

    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
        fetchUserData()
    }
    
    
    func fetchUserData() {
        networkService.fetchData(
            urlString: urlString,
            httpMethod: "GET",
            headers: nil,
            decoder: JSONDecoder()
        ) { (result: Result<UserResponse, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let userResponse):
                    let userData = userResponse.data
                    let selectedUser = User(id: userData.id,
                         username: userData.username,
                         bio: userData.bio,
                         counts: .init(followedBy: userData.counts.followedBy,
                                       follows: userData.counts.follows,
                                       media: userData.counts.media))
                    
                    self.user = selectedUser

                case .failure(let error):
                    print("Error fetching user data: \(error)")
                }
            }
        }
    }
    
    func getUser() -> User? {
        guard let user = user else { return nil }
        return user
    }
    
    
    struct Movie {
        let id: Int
        let image: UIImage?
    }
    
    let droebiti: [Movie] = [
        Movie(id: 10, image: UIImage(named: "Profile")),
        Movie(id: 11, image: UIImage(named: "Profile")),
        Movie(id: 12, image: UIImage(named: "Profile")),
        Movie(id: 13, image: UIImage(named: "Profile")),
        Movie(id: 14, image: UIImage(named: "Profile")),
        Movie(id: 15, image: UIImage(named: "Profile")),
        Movie(id: 16, image: UIImage(named: "Profile")),
        Movie(id: 17, image: UIImage(named: "Profile")),
        Movie(id: 18, image: UIImage(named: "Profile")),
        Movie(id: 19, image: UIImage(named: "Profile")),
        Movie(id: 20, image: UIImage(named: "Profile")),
        Movie(id: 21, image: UIImage(named: "Profile")),
        Movie(id: 22, image: UIImage(named: "Profile")),
        Movie(id: 23, image: UIImage(named: "Profile")),
        Movie(id: 24, image: UIImage(named: "Profile")),
        Movie(id: 25, image: UIImage(named: "Profile")),
        Movie(id: 26, image: UIImage(named: "Profile")),
        Movie(id: 27, image: UIImage(named: "Profile")),
        Movie(id: 28, image: UIImage(named: "Profile"))
    ]
}

     

    
    
    
   
    
    

