//
//  UserInfoView.swift
//  Insatgram
//
//  Created by Apple on 22.11.24.
//

import UIKit

final class UserInfoView: UIViewController {
    
    private let userNicknameLabel: UILabel = {
        let name = UILabel()
        name.text = "andria_gv"
        name.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let blockImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "lock.fill")
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Profile")
        imageView.layer.borderWidth = 2.0
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.tintColor = .black
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let userNameLable: UILabel = {
        let name = UILabel()
        name.text = "Andria Gvaramia"
        name.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let bioLable:  UILabel = {
        let label = UILabel()
        label.text = "aq daiwe reba ram ame ra ndo muli sisu lele dai we "
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        let itemWidth = UIScreen.main.bounds.width / 2
        label.widthAnchor.constraint(equalToConstant: itemWidth).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let editButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Edit Profile", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.borderWidth = 2.0
        btn.layer.borderColor = UIColor.gray.cgColor
        btn.titleLabel?.textAlignment = .center
        btn.layer.cornerRadius = 10.0
        return btn
    }()

    
    lazy var labelPost = makeLabel(title: "Post", size: 13)
    lazy var labelFollovers = makeLabel(title: "Follovers", size: 13)
    lazy var labelFollowing = makeLabel(title: "Following", size: 13)
    lazy var label54 = makeLabel(title: "  54", size: 16)
    lazy var label834 = makeLabel(title: "  834", size: 16)
    lazy var label162 = makeLabel(title: "  162", size: 16)


    let horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }
    
    private func setupUi() {

        setupHorizontalStackView()
        setupMainView()
    }
    
    private func setupMainView() {
        view.addSubview(userNicknameLabel)
        view.addSubview(blockImage)
        view.addSubview(horizontalStackView)
        view.addSubview(userImage)
        view.addSubview(userNameLable)
        view.addSubview(bioLable)
        view.addSubview(editButton)
        
        userImage.layer.cornerRadius = 50
        
        let itemWidth = UIScreen.main.bounds.width / 2
        
        
        NSLayoutConstraint.activate([
            userNicknameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: itemWidth / 3),
            userNicknameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            blockImage.centerYAnchor.constraint(equalTo: userNicknameLabel.centerYAnchor),
            blockImage.rightAnchor.constraint(equalTo: userNicknameLabel.leftAnchor, constant: -10),
            
            horizontalStackView.topAnchor.constraint(equalTo: userNicknameLabel.topAnchor, constant: 70),
            
            userImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            userImage.rightAnchor.constraint(equalTo: horizontalStackView.leftAnchor, constant: -30),
            userImage.centerYAnchor.constraint(equalTo: horizontalStackView.centerYAnchor),

            userNameLable.leadingAnchor.constraint(equalTo: userImage.leadingAnchor),
            userNameLable.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 10),
            
            bioLable.leadingAnchor.constraint(equalTo: userImage.leadingAnchor),
            bioLable.topAnchor.constraint(equalTo: userNameLable.bottomAnchor, constant: 10),
            
            editButton.topAnchor.constraint(equalTo: bioLable.bottomAnchor, constant: 20),
            
            editButton.leadingAnchor.constraint(equalTo: userImage.leadingAnchor),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            editButton.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
        
    
    private func setupHorizontalStackView() {
        
        horizontalStackView.addArrangedSubview(addLablesInHorizontalStackView(label1: label54, label2:labelPost ))
        horizontalStackView.addArrangedSubview(addLablesInHorizontalStackView(label1: label834, label2: labelFollovers))
        horizontalStackView.addArrangedSubview(addLablesInHorizontalStackView(label1: label162, label2: labelFollowing))
    }
    
    private func makeLabel(title: String, size: CGFloat?) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: size ?? 13 , weight: .regular)
        label.text = title
        label.textColor = .black
        return label
    }
    
    private func addLablesInHorizontalStackView(label1: UILabel, label2: UILabel) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 2
        stack.addArrangedSubview(label1)
        stack.addArrangedSubview(label2)
        return stack
    }
}


#Preview() {
    UserInfoView()
}

