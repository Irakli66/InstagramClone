//
//  LikesPageViewController.swift
//  Instagram
//
//  Created by irakli kharshiladze on 22.11.24.
//

import UIKit

class LikesPageViewController: UIViewController {
    private let tableView = UITableView() // UITableView ელემენტი, რომელიც აჩვენებს სიას.
    private let viewModel = LikesPageViewModel() // ViewModel, რომელიც მართავს მონაცემებს.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI() // UI-ის განლაგების დაწყება
    }

    private func setupUI() {
        view.backgroundColor = .white // განახლებულია ფონდის ფერი

        tableView.frame = view.bounds // UITableView-ის ზომის დაყენება
        tableView.delegate = self // UITableView-ის დელეგატის დადგენა
        tableView.dataSource = self // UITableView-ის მონაცემთა წყაროს დადგენა
        tableView.register(LikesTableViewCell.self, forCellReuseIdentifier: "LikesTableViewCell") // რეგისტრაცია უჯრედის კლასის
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "HeaderView") // რეგისტრაცია სათაურის ფორმატისთვის
        view.addSubview(tableView) // UITableView-ის დამატება გვერდზე
    }
}

extension LikesPageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count // უბრუნებს შესაბამის განყოფილებათა რაოდენობას
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections[section].1.count // უბრუნებს რიგების რაოდენობას მოცემულ განყოფილებაში
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60 // თითოეული უჯრედის სიმაღლე
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView")!
        header.textLabel?.text = viewModel.sections[section].0 // სათაურის ტექსტის მითითება
        header.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold) // სათაურის შრიფტის განლაგება
        header.textLabel?.textColor = .black // სათაურის ფერის შეცვლა
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30 // სათაურის სიმაღლე
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikesTableViewCell", for: indexPath) as! LikesTableViewCell
        let item = viewModel.sections[indexPath.section].1[indexPath.row] // მონაცემების ამოღება
        cell.configure(profileImageName: item.profileImageName, message: item.message, postImageName: item.postImageName) // უჯრედის კონფიგურაცია
        return cell
    }
}

class LikesTableViewCell: UITableViewCell {
    private let profileImageView = UIImageView() // პროფილის სურათის უახლესი გამოსახულება
    private let messageLabel = UILabel() // შეტყობინების ტექსტი
    private let postImageView = UIImageView() // პოსტის სურათი
    private let followButton = FollowButton() // Follow ღილაკი
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI() // UI-ს დაყენება
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented") // აუცილებელია init მეთოდის განხორციელება
    }
    
    private func setupUI() {
        profileImageView.frame = CGRect(x: 16, y: 8, width: 44, height: 44) // პროფილის სურათის განლაგება
        profileImageView.layer.cornerRadius = 22 // პროფილის სურათის რადიუსის გადაჭრა
        profileImageView.clipsToBounds = true // ზედმეტი კონტენტის დამალვა
        contentView.addSubview(profileImageView) // პროფილის სურათის დამატება უჯრედში
        
        messageLabel.frame = CGRect(x: 72, y: 8, width: 220, height: 44) // შეტყობინების ლეიბლის განლაგება
        messageLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular) // შრიფტის სტილი
        messageLabel.numberOfLines = 2 // მრავალ ხაზზე ტექსტის განლაგება
        contentView.addSubview(messageLabel) // შეტყობინების ლეიბლის დამატება
        
        postImageView.frame = CGRect(x: contentView.bounds.width - 1, y: 8, width: 44, height: 44) // პოსტის სურათის განლაგება
        postImageView.layer.cornerRadius = 0 // პოსტის სურათის რადიუსის გადაჭრა
        postImageView.clipsToBounds = true // ზედმეტი კონტენტის დამალვა
        postImageView.alpha = 0 // საწყისი გამჭვირვალობა
        contentView.addSubview(postImageView) // პოსტის სურათის დამატება
        
        followButton.frame = CGRect(x: contentView.bounds.width - 20, y: 10, width: 90, height: 28) // Follow ღილაკის განლაგება
        followButton.isHidden = true // Follow ღილაკის საწყისი დამალვა
        contentView.addSubview(followButton) // Follow ღილაკის დამატება
    }

    func configure(profileImageName: String, message: String, postImageName: String?) {
        profileImageView.image = UIImage(named: profileImageName) // პროფილის სურათის განახლება
        messageLabel.text = message // შეტყობინების განახლება
        
        if let postImageName = postImageName {
            postImageView.isHidden = false // პოსტის სურათის ჩვენება
            postImageView.image = UIImage(named: postImageName) // პოსტის სურათის განახლება
            postImageView.alpha = 1 // პოსტის სურათის გამჭვირვალობის განახლება
            followButton.isHidden = true // Follow ღილაკის დამალვა
        } else {
            postImageView.isHidden = true // პოსტის სურათის დამალვა
            postImageView.alpha = 0 // პოსტის სურათის გამჭვირვალობის შემცირება
            followButton.isHidden = false // Follow ღილაკის ჩვენება
        }
    }
}
