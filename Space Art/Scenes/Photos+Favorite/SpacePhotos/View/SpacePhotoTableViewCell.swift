//
//  SpacePhotoTableViewCell.swift
//  Space Art
//
//  Created by jeovane.barbosa on 28/12/22.
//

import UIKit
import Kingfisher

class SpacePhotoTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewCode()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.photo = nil
    }
    
    var photo: Photo? {
        didSet {
            guard let photo = photo else {return}
            titleLabel.text = photo.title
            dateLabel.text = photo.date
            
            guard let photoUrl = photo.url,
                  let url = URL(string: photoUrl) else {return}
            apodImageView.kf.setImage(with: url)
            
            if likeCounter.text == "0"{
                likeCounter.text = String(describing: Int.random(in: 0...100))
            }
            
            guard let isFavorited = photo.isFavorited,
                  let isLiked = photo.isLiked else {return}
            
            isFavorited ? setFavorite() : unsetFavorite()
            isLiked ? setLike() : setUnlike()
            
            
            if let copyright = photo.copyright, !copyright.isEmpty {
                copyrightLabel.text = copyright
                return
            }
            dotSeparator.isHidden = true
            copyrightLabel.isHidden = true
        }
    }
    
//-----------------------------------------------------------------//
//MARK: - Implements SpacePhotoTableViewCell
//-----------------------------------------------------------------//
    private lazy var containerStackView: UIView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 12, left: 20, bottom: 12, right: 20)
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 12
        stackView.layer.masksToBounds = true
        stackView.layer.cornerRadius = 20
        stackView.backgroundColor = .darkMaroto
        
        stackView.addArrangedSubview(apodImageView)
        stackView.addArrangedSubview(labelsStackView)
        
        return stackView
    }()
    
    private lazy var apodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.backgroundColor = .white
        imageView.tintColor = .tertiaryLabel
        imageView.image = .init(systemName: "apple.logo")
        imageView.image?.withTintColor(.tertiaryLabel)
        
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 30),
            imageView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        return imageView
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.spacing = 6
        stackview.distribution = .fill
        
        stackview.addArrangedSubview(titleLabel)
        stackview.addArrangedSubview(subtitleStackView)
        stackview.addArrangedSubview(interactionStackView)
        
        return stackview
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.text = "Insert title here"
        
        return label
    }()
    
    private lazy var subtitleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 6
        
        
        stackView.addArrangedSubview(copyrightLabel)
        stackView.addArrangedSubview(dotSeparator)
        stackView.addArrangedSubview(dateLabel)
        
        return stackView
    }()
    
    private lazy var copyrightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .white
        label.text = "Jeovane barbosa"
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        return label
    }()
    
    
    private lazy var dotSeparator: UIView = {
        let viewSeparator = UIView()
        viewSeparator.translatesAutoresizingMaskIntoConstraints = false
        
        viewSeparator.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        viewSeparator.backgroundColor = .white
        viewSeparator.tintColor = .white
        
        
        NSLayoutConstraint.activate([
            viewSeparator.heightAnchor.constraint(equalToConstant: 3),
            viewSeparator.widthAnchor.constraint(equalToConstant: 3)
        ])
        
        return viewSeparator
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .white
        label.text = "1985/02/25"
        
        return label
    }()
    
    private lazy var interactionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 16, left: 0, bottom: 0, right: 0)
        
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.distribution = .fill
        stackView.alignment = .center
        
        stackView.addArrangedSubview(favoriteButton)
        stackView.addArrangedSubview(likeStackView)
        stackView.addArrangedSubview(fillerView)
        
        return stackView
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton(configuration: .plain())
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.configuration?.image = .init(systemName: "star")
        button.tintColor = .white
        
        button.addTarget(self, action: #selector(favoriteButtonClicked), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var likeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 4, left: 0, bottom: 4, right: 14)
        
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.backgroundColor = .tertiaryLabel
        stackView.layer.masksToBounds = true
        stackView.layer.cornerRadius = 14
        
        stackView.addArrangedSubview(likeButton)
        stackView.addArrangedSubview(likeCounter)
        
        return stackView
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(configuration: .plain())
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.configuration?.image = .init(systemName: "heart")
        button.tintColor = .white
        button.isHighlighted = false
        button.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var likeCounter: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "0"
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var fillerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
//-----------------------------------------------------------------//
//MARK: - Implements Helper Methods
//-----------------------------------------------------------------//
    @IBAction func favoriteButtonClicked() {
        guard let photo = photo else {return}
        photo.pressedFavorited()
        
        guard let isFavorited = photo.isFavorited else {return}
        
        isFavorited ? setFavorite() : unsetFavorite()
    }
    
    @IBAction func likeButtonPressed() {
        guard let photo = photo else {return}
        photo.pressedLike()
        
        guard let isLiked = photo.isLiked else {return}
        
        isLiked ? setLike() : setUnlike()
    }
    
    private func setFavorite() {
        favoriteButton.configuration?.image = .init(systemName: "star.fill")
    }
    
    private func unsetFavorite() {
        favoriteButton.configuration?.image = .init(systemName: "star")
    }
    
    private func setLike() {
        likeButton.isHighlighted = true
        likeButton.configuration?.image = .init(systemName: "heart.fill")
        likeButton.tintColor = .red
        
        guard let currentCount = Int(likeCounter.text!) else {return}
        likeCounter.text = String(describing: currentCount + 1)
    }
    
    private func setUnlike() {
        likeButton.isHighlighted = false
        likeButton.configuration?.image = .init(systemName: "heart")
        likeButton.tintColor = .white
        
        guard let currentCount = Int(likeCounter.text!) else {return}
        likeCounter.text = String(describing: currentCount - 1)
    }
}

//-----------------------------------------------------------------//
//MARK: - Implements Viewcode Protocol
//-----------------------------------------------------------------//
extension SpacePhotoTableViewCell: Viewcode {
    
    func buildHierarchies() {
        contentView.addSubview(containerStackView)
    }
    
    func addConstraints() {
        //containerView constraints
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            containerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6)
        ])
        
    }    
    
    func applyAdditionalSetup() {
        backgroundColor = .clear
    }
    
    
}
