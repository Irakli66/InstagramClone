//
//  ProfilePageViewController.swift
//  Insatgram
//
//  Created by irakli kharshiladze on 22.11.24.
//

import UIKit

final class ProfilePageViewController: UIViewController {
    
    let viewModel = ProfilePageViewModel()
    
    private let userInfoViewController: UserInfoView = {
        let viewController = UserInfoView()
        return viewController
    }()
    
    private let userFotoCollectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical

        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 20) / 3
        collectionLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }
    
    private func setupUi() {
        setupUserInfoView()
        setupCollectionView()
    }
    
    private func setupUserInfoView() {
        addChild(userInfoViewController)
        view.addSubview(userInfoViewController.view)
        userInfoViewController.view.frame = view.bounds
        userInfoViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userInfoViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userInfoViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userInfoViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            userInfoViewController.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.52)
        ])
        userInfoViewController.didMove(toParent: self)
    }
    
    private func setupCollectionView() {
        view.addSubview(userFotoCollectionView)
        
        // Register UICollectionViewCell
        userFotoCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ImageViewCell")
        
        userFotoCollectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            userFotoCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            userFotoCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            userFotoCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            userFotoCollectionView.topAnchor.constraint(equalTo: userInfoViewController.view.bottomAnchor)
        ])
    }
}

extension ProfilePageViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.droebiti.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageViewCell", for: indexPath)
        
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        let imageView = UIImageView(image: viewModel.droebiti[indexPath.row].image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = cell.bounds
        cell.contentView.addSubview(imageView)
        
        return cell
    }
}

#Preview {
    ProfilePageViewController()
}
