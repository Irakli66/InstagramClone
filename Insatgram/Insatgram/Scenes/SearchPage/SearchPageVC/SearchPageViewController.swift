//
//  SearchPageViewController.swift
//  Instagram
//
//  Created by irakli kharshiladze on 22.11.24.

import UIKit

final class SearchPageViewController: UIViewController {
    private var collectionView: UICollectionView?
    private let searchPageViewModel = SearchPageViewModel()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.backgroundColor = .systemBackground
        return searchBar
    }()
    
    private let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let searchOverlayView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.alpha = 0
        view.isHidden = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupTopView()
        setupCollectionView()
        setupSearchOverlayView()
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.topItem?.titleView = searchBar
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.topItem?.titleView = nil
        searchBar.resignFirstResponder()
    }
    
    private func setupTopView() {
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 12)
        ])
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        guard let collectionView = collectionView else { return }
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupSearchOverlayView() {
        view.addSubview(searchOverlayView)
        searchOverlayView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchOverlayView.topAnchor.constraint(equalTo: view.topAnchor),
            searchOverlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchOverlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchOverlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension SearchPageViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        didCancelSearch()
        guard let text = searchBar.text, !text.isEmpty else {
            return
        }
        query(text)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didCancelSearch))
        
        searchOverlayView.isHidden = false
        UIView.animate(withDuration: 0.1) {
            self.searchOverlayView.alpha = 1
        }
        searchBar.becomeFirstResponder()
    }
    
    @objc private func didCancelSearch() {
        searchBar.resignFirstResponder()
        navigationItem.rightBarButtonItem = nil
        searchBar.text = ""
        UIView.animate(withDuration: 0.1, animations: {
            self.searchOverlayView.alpha = 0
        }) { _ in
            self.searchOverlayView.isHidden = true
        }
    }
    
    
    private func query(_ text: String) {
        // Implement query
    }
}

extension SearchPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchPageViewModel.getMediaCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        let currentImage = searchPageViewModel.getImage(at: indexPath.row)
        cell.configure(with: currentImage)
        return cell
    }
}
//ეს ბოლომდე არ მუშაობს, პროპორციები სწორად დავსვვი, მაგრამ ვერტიკალურად ვერ ვსტაკავ პატარებს. ასევე, სწრაფად თუ სქროლავ სურათები იშაფლებასავით, რომელიც გაუთვალისწინებელი ბაგია და არ ვიცი რა იწვევს.
extension SearchPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        if indexPath.row % 8 == 0 {
            return CGSize(width: width*2/3 - 2/3, height: width*2/3 - 2/3)
        } else {
            return CGSize(width: (width - 4) / 3, height: (width - 4) / 3)
        }
    }
}
