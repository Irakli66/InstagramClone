//
//  PhotoCollectionViewCell.swift
//  Insatgram
//
//  Created by Elene on 24.11.24.
//
import Foundation
import UIKit
 
final class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    func configure(with media: MediaModel) {
        guard let url = URL(string: media.imageUrl) else {
            return
        }
        
        imageView.imageFrom(url: url)
    }
}
