//
//  MainPageViewController.swift
//  Insatgram
//
//  Created by irakli kharshiladze on 22.11.24.
//

import UIKit

final class MainPageViewController: UIViewController {
    
    private let instagramLogoImage = UIImageView()
    
    private let headerView: UIView = {
        let hv = UIView()
        hv.backgroundColor = .white
        return hv
    }()
    
    //tableView-თი უნდა გადაკეთდეს ეს
    private let viewForMainCell: UIView = {
        let vfc = UIView()
        vfc.backgroundColor = .white
        return vfc
    }()
    
    private let postAutorView: UIView = {
        let pav = UIView()
        pav.backgroundColor = .white
        return pav
    }()
    
    private let postAutorPhoto = UIImageView()
    private let postAutorName = UILabel()
    private let postLocation = UILabel()
    
    //collectionView-თი უნდა ჩანაცვლდეს
    private let viewForPhotosCell: UIView = {
        let vfpc = UIView()
        vfpc.backgroundColor = .white
        return vfpc
    }()
    
    private let viewForButtons: UIView = {
        let vfb = UIView()
        vfb.backgroundColor = .white
        return vfb
    }()
    
    private let likeButton = UIButton(type: .custom)
    private let commentButton = UIButton(type: .custom)
    private let forwardButton = UIButton(type: .custom)
    
    private let viewForPostDetails: UIStackView = {
        let vfpd = UIStackView()
        vfpd.backgroundColor = .white
        return vfpd
    }()
    
    private let postDetailsPhoto = UIImageView()
    private let postDetailsLikelabel = UILabel()
    private let postDetailsCommentLabel = UILabel()
    private let postDetailsDateLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .cyan
        
        setupHeaderView()
        setupViewForMainCell()
        setupPostAutorView()
        setupViewForPhotosCell()
        setupViewForButtons()
        setupViewForPostDetails()
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
    
    private func setupPostAutorView() {
        viewForMainCell.addSubview(postAutorView)
        postAutorView.translatesAutoresizingMaskIntoConstraints = false
        
        postAutorView.addSubview(postAutorPhoto)
        postAutorPhoto.translatesAutoresizingMaskIntoConstraints = false
        postAutorPhoto.image = UIImage(named: "MainPagePostAutorPhoto")
        
        postAutorView.addSubview(postAutorName)
        postAutorName.translatesAutoresizingMaskIntoConstraints = false
        postAutorName.text = "joshua_I"
        postAutorName.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        postAutorName.textColor = .black
        
        postAutorView.addSubview(postLocation)
        postLocation.translatesAutoresizingMaskIntoConstraints = false
        postLocation.text = "Tokyo, Japan"
        postLocation.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        postLocation.textColor = .black
        
        NSLayoutConstraint.activate([
            
            postAutorView.topAnchor.constraint(equalTo: viewForMainCell.topAnchor),
            postAutorView.leftAnchor.constraint(equalTo: viewForMainCell.leftAnchor),
            postAutorView.rightAnchor.constraint(equalTo: viewForMainCell.rightAnchor),
            postAutorView.heightAnchor.constraint(equalToConstant: 60),
            
            postAutorPhoto.centerYAnchor.constraint(equalTo: postAutorView.centerYAnchor),
            postAutorPhoto.leftAnchor.constraint(equalTo: postAutorView.leftAnchor, constant: 10),
            postAutorPhoto.heightAnchor.constraint(equalToConstant: 35),
            postAutorPhoto.widthAnchor.constraint(equalToConstant: 32),
            
            postAutorName.topAnchor.constraint(equalTo: postAutorPhoto.topAnchor),
            postAutorName.leftAnchor.constraint(equalTo: postAutorPhoto.rightAnchor, constant: 10),
            
            postLocation.bottomAnchor.constraint(equalTo: postAutorPhoto.bottomAnchor),
            postLocation.leftAnchor.constraint(equalTo: postAutorName.leftAnchor),
            
        ])
    }
    
    private func setupViewForMainCell() {
        view.addSubview(viewForMainCell)
        viewForMainCell.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            viewForMainCell.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            viewForMainCell.leftAnchor.constraint(equalTo: view.leftAnchor),
            viewForMainCell.rightAnchor.constraint(equalTo: view.rightAnchor),
            viewForMainCell.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupViewForPhotosCell() {
        viewForMainCell.addSubview(viewForPhotosCell)
        viewForPhotosCell.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            viewForPhotosCell.topAnchor.constraint(equalTo: postAutorView.bottomAnchor),
            viewForPhotosCell.leftAnchor.constraint(equalTo: viewForMainCell.leftAnchor),
            viewForPhotosCell.rightAnchor.constraint(equalTo: viewForMainCell.rightAnchor),
            viewForPhotosCell.heightAnchor.constraint(equalToConstant: 407),
        ])
    }
    
    private func setupViewForButtons() {
        viewForMainCell.addSubview(viewForButtons)
        viewForButtons.translatesAutoresizingMaskIntoConstraints = false
        
        viewForButtons.addSubview(likeButton)
        likeButton.backgroundColor = .none
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.setImage(UIImage(named: "Heart"), for: .normal)
        likeButton.tintColor = .black
        
        viewForButtons.addSubview(commentButton)
        commentButton.backgroundColor = .none
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        commentButton.setImage(UIImage(named: "Heart"), for: .normal)
        commentButton.tintColor = .black
        
        viewForButtons.addSubview(forwardButton)
        forwardButton.backgroundColor = .none
        forwardButton.translatesAutoresizingMaskIntoConstraints = false
        forwardButton.setImage(UIImage(named: "Heart"), for: .normal)
        forwardButton.tintColor = .black
        
        NSLayoutConstraint.activate([
            
            viewForButtons.topAnchor.constraint(equalTo: viewForPhotosCell.bottomAnchor),
            viewForButtons.leftAnchor.constraint(equalTo: viewForMainCell.leftAnchor),
            viewForButtons.rightAnchor.constraint(equalTo: viewForMainCell.rightAnchor),
            viewForButtons.heightAnchor.constraint(equalToConstant: 53),
            
            likeButton.leftAnchor.constraint(equalTo: viewForButtons.leftAnchor, constant: 14),
            likeButton.centerYAnchor.constraint(equalTo: viewForButtons.centerYAnchor),
            likeButton.widthAnchor.constraint(equalToConstant: 23),
            likeButton.heightAnchor.constraint(equalToConstant: 23),
            
            commentButton.leftAnchor.constraint(equalTo: likeButton.rightAnchor, constant: 17.5),
            commentButton.centerYAnchor.constraint(equalTo: viewForButtons.centerYAnchor),
            commentButton.widthAnchor.constraint(equalToConstant: 23),
            commentButton.heightAnchor.constraint(equalToConstant: 23),
            
            forwardButton.leftAnchor.constraint(equalTo: commentButton.rightAnchor, constant: 17.5),
            forwardButton.centerYAnchor.constraint(equalTo: viewForButtons.centerYAnchor),
            forwardButton.widthAnchor.constraint(equalToConstant: 23),
            forwardButton.heightAnchor.constraint(equalToConstant: 23),
        ])
    }
    
    private func setupViewForPostDetails() {
        viewForMainCell.addSubview(viewForPostDetails)
        viewForPostDetails.translatesAutoresizingMaskIntoConstraints = false
        
        viewForPostDetails.addSubview(postDetailsPhoto)
        postDetailsPhoto.translatesAutoresizingMaskIntoConstraints = false
        postDetailsPhoto.image = UIImage(named: "MainPagePostAutorPhoto")
        
        viewForPostDetails.addSubview(postDetailsLikelabel)
        postDetailsLikelabel.translatesAutoresizingMaskIntoConstraints = false
        postDetailsLikelabel.text = "Liked by craig_love and 44,686 others"
        postDetailsLikelabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        postDetailsLikelabel.textColor = .black
        
        viewForPostDetails.addSubview(postDetailsCommentLabel)
        postDetailsCommentLabel.translatesAutoresizingMaskIntoConstraints = false
        postDetailsCommentLabel.text = "joshua_l The game in Japan was amazing and I want to share some photos"
        postDetailsCommentLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        postDetailsCommentLabel.numberOfLines = 0
        postDetailsCommentLabel.sizeToFit()
        postDetailsCommentLabel.textColor = .black
        
        viewForPostDetails.addSubview(postDetailsDateLabel)
        postDetailsDateLabel.translatesAutoresizingMaskIntoConstraints = false
        postDetailsDateLabel.text = "September 19"
        postDetailsDateLabel.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        postDetailsDateLabel.textColor = .gray
        
        NSLayoutConstraint.activate([
            
            viewForPostDetails.topAnchor.constraint(equalTo: viewForButtons.bottomAnchor),
            viewForPostDetails.leftAnchor.constraint(equalTo: viewForMainCell.leftAnchor),
            viewForPostDetails.rightAnchor.constraint(equalTo: viewForMainCell.rightAnchor),
            viewForPostDetails.bottomAnchor.constraint(equalTo: viewForMainCell.bottomAnchor),
            
            postDetailsPhoto.topAnchor.constraint(equalTo: viewForPostDetails.topAnchor),
            postDetailsPhoto.leftAnchor.constraint(equalTo: likeButton.leftAnchor),
            postDetailsPhoto.heightAnchor.constraint(equalToConstant: 18.5),
            postDetailsPhoto.widthAnchor.constraint(equalToConstant: 17),
            
            postDetailsLikelabel.topAnchor.constraint(equalTo: postDetailsPhoto.topAnchor),
            postDetailsLikelabel.leftAnchor.constraint(equalTo: postDetailsPhoto.rightAnchor, constant: 6.5),
            
            postDetailsCommentLabel.topAnchor.constraint(equalTo: postDetailsPhoto.bottomAnchor, constant: 5),
            postDetailsCommentLabel.leftAnchor.constraint(equalTo: postDetailsPhoto.leftAnchor),
            postDetailsCommentLabel.rightAnchor.constraint(equalTo: viewForPostDetails.rightAnchor, constant: 14),
            
            postDetailsDateLabel.topAnchor.constraint(equalTo: postDetailsCommentLabel.bottomAnchor, constant: 13),
            postDetailsDateLabel.leftAnchor.constraint(equalTo: postDetailsPhoto.leftAnchor),
        ])
    }
    
}

