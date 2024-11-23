//
//  LikesPageViewController.swift
//  Instagram
//
//  Created by irakli kharshiladze on 22.11.24.
//

import UIKit

class LikesPageViewController: UIViewController {
    private let tableView = UITableView()
    private let viewModel = LikesPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = "Likes"
        
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LikesTableViewCell.self, forCellReuseIdentifier: "LikesTableViewCell")
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "HeaderView")
        
        view.addSubview(tableView)
    }
    
    private func fetchData() {
        viewModel.fetchLikes { [weak self] success in
            if success {
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            } else {
                print("Failed to fetch data")
            }
        }
    }
}

extension LikesPageViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections[section].1.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // Custom header for each section
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView")
        header?.textLabel?.text = viewModel.sections[section].0 // Section title
        header?.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        header?.textLabel?.textColor = .black
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikesTableViewCell", for: indexPath) as! LikesTableViewCell
        let item = viewModel.sections[indexPath.section].1[indexPath.row]
        cell.configure(profileImageName: item.profileImageName, message: item.message, postImageName: item.postImageName)
        return cell
    }
}

class LikesTableViewCell: UITableViewCell {
    private let profileImageView = UIImageView()
    private let messageLabel = UILabel()
    private let postImageView = UIImageView()
    private let followButton = FollowButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        profileImageView.frame = CGRect(x: 16, y: 8, width: 44, height: 44)
        profileImageView.layer.cornerRadius = 22
        profileImageView.clipsToBounds = true
        contentView.addSubview(profileImageView)
        
        messageLabel.frame = CGRect(x: 72, y: 8, width: 220, height: 44)
        messageLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        messageLabel.numberOfLines = 2
        contentView.addSubview(messageLabel)
        
        postImageView.frame = CGRect(x: contentView.bounds.width - 1, y: 8, width: 44, height: 44)
        postImageView.layer.cornerRadius = 0
        postImageView.clipsToBounds = true
        postImageView.alpha = 0
        contentView.addSubview(postImageView)
        
        followButton.frame = CGRect(x: contentView.bounds.width - 20, y: 10, width: 90, height: 28)
        followButton.isHidden = true
        contentView.addSubview(followButton)
    }

    func configure(profileImageName: String, message: String, postImageName: String?) {
        profileImageView.image = UIImage(named: profileImageName)
        messageLabel.text = message
        
        if let postImageName = postImageName {
            postImageView.isHidden = false
            postImageView.image = UIImage(named: postImageName)
            postImageView.alpha = 1
            followButton.isHidden = true
        } else {
            postImageView.isHidden = true
            postImageView.alpha = 0
            followButton.isHidden = false
        }
    }
}
