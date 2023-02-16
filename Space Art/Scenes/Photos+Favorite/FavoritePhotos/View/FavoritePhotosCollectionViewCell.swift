//
//  FavoritePhotosCollectionViewCell.swift
//  Space Art
//
//  Created by Jeovane Barbosa on 15/02/23.
//

import Foundation
import UIKit
import Kingfisher

class FavoritePhotosCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCode()

    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var photo: Photo? {
        didSet {
            guard let photo = photo,
                let urlString = photo.url,
                let url = URL(string: urlString) else {return}
            photoImageView.kf.setImage(with: url)
        }
    }
    
//-----------------------------------------------------------------//
//MARK: - Implements FavoritePhotosCollectionViewCell
//-----------------------------------------------------------------//
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
}

//-----------------------------------------------------------------//
//MARK: - Implements Viewcode Protocol
//-----------------------------------------------------------------//

extension FavoritePhotosCollectionViewCell: Viewcode {
    func buildHierarchies() {
        contentView.addSubview(photoImageView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func applyAdditionalSetup() {

    }
    
    
}
