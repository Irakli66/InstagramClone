//
//  NetworkManager.swift
//  Insatgram
//
//  Created by Apple on 24.11.24.
//


import NetworkPackage
import Foundation

final class MainPageViewModel {
    
    var postsCanged: ( () -> Void)?
    
    private let networkService: NetworkServiceProtocol
    private var posts: [Post] = []
    private var urlString: String {
        "http://localhost:3000/v1/users/self/feed"
    }
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
        fetchUserData()
    }
    
    private func fetchUserData() {
        networkService.fetchData(
            urlString: urlString,
            httpMethod: "GET",
            headers: nil,
            decoder: JSONDecoder()
        ) { [weak self] (result: Result<PostResponse, NetworkError>) in
            switch result {
            case .success(let postResponse):
                self?.posts = postResponse.data
                self?.postsCanged?()
            case .failure(let error):
                print("Error fetching user data: \(error)")
            }
        }
    }
    
    func getPost(at index: Int) -> Post {
        posts[index]
    }
    
    func postCount() -> Int {
        posts.count
    }
    
    func collectionImagesCount(at index: Int) -> Int {
        posts[index].images.count
    }
}

