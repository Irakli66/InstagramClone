//
//  MainPageViewController.swift
//  Insatgram
//
//  Created by irakli kharshiladze on 22.11.24.
//

import UIKit

final class MainPageViewController: UIViewController {
        
    private let instagramLogoImage = UIImageView()
    
    private lazy var newsFeedTableView: UITableView = {
        let tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = .white
        return tableview
    }()
    
//    private lazy var newsFeedPhotosCollectionView: UICollectionView = {
////        let collectionView = UICollectionView()
////        collectionView.delegate = self
////        collectionView.dataSource = self
////        collectionView.translatesAutoresizingMaskIntoConstraints = false
////        
////        collectionView.scrollIndicatorInsets
////        collectionView.backgroundColor = .red
////        return collectionView
//        
//        let collectionLayout = UICollectionViewFlowLayout()
//        collectionLayout.scrollDirection = .horizontal
//        
//        let screenWidth = UIScreen.main.bounds.width
//        let itemWidth = screenWidth
//        collectionLayout.itemSize = CGSize(width: itemWidth, height: 407)
//        
//        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
//        collection.backgroundColor = .clear
//        collection.translatesAutoresizingMaskIntoConstraints = false
//        return collection
//    }()
    
    private let headerView: UIView = {
        let hv = UIView()
        hv.backgroundColor = .white
        return hv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .cyan
        
        setupHeaderView()
        setupMainTableView()
        //setupMainCollectionView()
    }
    
    private func setupHeaderView() {
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(instagramLogoImage)
        instagramLogoImage.translatesAutoresizingMaskIntoConstraints = false
        instagramLogoImage.image = UIImage(named: "InstagramLogo")
        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 44),
            
            instagramLogoImage.topAnchor.constraint(equalTo: headerView.topAnchor),
            instagramLogoImage.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            instagramLogoImage.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
        ])
    }
    
    
    private func setupMainTableView() {
        view.addSubview(newsFeedTableView)
        newsFeedTableView.register(NewsFeedTableViewCell.self, forCellReuseIdentifier: "NewsFeedTableViewCell")

        NSLayoutConstraint.activate([
            
            newsFeedTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            newsFeedTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            newsFeedTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            newsFeedTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
//    private func setupMainCollectionView() {
//        view.addSubview(newsFeedPhotosCollectionView)
//        newsFeedPhotosCollectionView.register(MainPageCollectionViewCell.self, forCellWithReuseIdentifier: "MainPageCollectionViewCell")
//
//        NSLayoutConstraint.activate([
//            
//            newsFeedPhotosCollectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
//            newsFeedPhotosCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
//            newsFeedPhotosCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
//            newsFeedPhotosCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//        ])
//    }
        
}

extension MainPageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedTableViewCell", for: indexPath) as! NewsFeedTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 625
    }
    
}


//extension MainPageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        3
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainPageCollectionViewCell", for: indexPath) as! MainPageCollectionViewCell
//        return cell
//    }
//}
