//
//  LikesPageViewController.swift
//  Instagram
//
//  Created by irakli kharshiladze on 22.11.24.
//

import UIKit

class LikesPageViewController: UIViewController {
    private let tableView = UITableView() // UITableView ელემენტი რომელიც აჩვენებს სიას
    private let viewModel = LikesPageViewModel() // ViewModel რომელიც მართავს მონაცემებს
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI() // UI-ის განლაგება
    }

    private func setupUI() {
        view.backgroundColor = .white //ბექგრაუნდი

        tableView.frame = view.bounds // UITableViewის ზომის დაყენება
        tableView.delegate = self // UITableViewის დელეგატის დადგენა
        tableView.dataSource = self // UITableViewის მონაცემთა წყაროს დადგენა
        tableView.register(LikesTableViewCell.self, forCellReuseIdentifier: "LikesTableViewCell")
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "HeaderView")
        view.addSubview(tableView)
    }
}

extension LikesPageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections[section].1.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView")!
        header.textLabel?.text = viewModel.sections[section].0 // სათაურის ტექსტის მითითება
        header.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold) // სათაურის შრიფტის განლაგება
        header.textLabel?.textColor = .black // სათაურის ფერის შეცვლა
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
    private let profileImageView = UIImageView() // პროფილის სურათი
    private let messageLabel = UILabel() // შეტყობინების ტექსტი
    private let postImageView = UIImageView() // პოსტის სურათი
    private let followButton = FollowButton() // Follow ღილაკი
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI() // UI-ს დაყენება
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        profileImageView.frame = CGRect(x: 16, y: 8, width: 44, height: 44) // პროფილის სურათის განლაგება
        profileImageView.layer.cornerRadius = 22
        profileImageView.clipsToBounds = true
        contentView.addSubview(profileImageView) // პროფილის სურათის დამატება უჯრედში
        
        messageLabel.frame = CGRect(x: 72, y: 8, width: 220, height: 44)
        messageLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        messageLabel.numberOfLines = 2
        contentView.addSubview(messageLabel)
        
        postImageView.frame = CGRect(x: contentView.bounds.width - 1, y: 8, width: 44, height: 44) // პოსტის სურათის განლაგება
        postImageView.layer.cornerRadius = 0
        postImageView.clipsToBounds = true
        postImageView.alpha = 0
        contentView.addSubview(postImageView)
        
        followButton.frame = CGRect(x: contentView.bounds.width - 20, y: 10, width: 90, height: 28) // Follow ღილაკის განლაგება
        followButton.isHidden = true
        contentView.addSubview(followButton)
    }

    func configure(profileImageName: String, message: String, postImageName: String?) {
        profileImageView.image = UIImage(named: profileImageName) // პროფილის სურათის განახლება
        messageLabel.text = message // შეტყობინების განახლება
        
        if let postImageName = postImageName {
            postImageView.isHidden = false // პოსტის სურათის ჩვენება
            postImageView.image = UIImage(named: postImageName) // პოსტის სურათის განახლება
            postImageView.alpha = 1
            followButton.isHidden = true // Follow ღილაკის დამალვა
        } else {
            postImageView.isHidden = true // პოსტის სურათის დამალვა
            postImageView.alpha = 0
            followButton.isHidden = false // Follow ღილაკის ჩვენება
        }
    }
}
