//
//  SpacePhotoTableViewCell.swift
//  Space Art
//
//  Created by jeovane.barbosa on 28/12/22.
//

import UIKit

class SpacePhotoTableViewCell: UITableViewCell {
    
    var photo: Photo? {
        didSet {
            guard let photo = photo else {return}
            titleLabel.text = photo.title
            dateLabel.text = photo.date
        }
    }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewCode()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        photo = nil
    }
    
    private lazy var containerStackView: UIView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 12
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 12, left: 20, bottom: 12, right: 20)
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
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.backgroundColor = .white
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
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private lazy var likeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 2
        
        return stackView
    }()

}

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
