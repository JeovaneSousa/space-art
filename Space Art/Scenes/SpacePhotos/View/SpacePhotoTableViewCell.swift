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
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 20
        view.backgroundColor = .darkMaroto
        
        return view
    }()
    
    lazy var labelsStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.isLayoutMarginsRelativeArrangement = true
        stackview.layoutMargins = UIEdgeInsets(top: 16, left: 24, bottom: 16, right: 24)
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.spacing = 6
        stackview.distribution = .fill
        stackview.addArrangedSubview(titleLabel)
        stackview.addArrangedSubview(dateLabel)
        
        return stackview
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.text = "Insert title here"
        
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .white
        label.text = "1985/02/25"
        
        return label
    }()
    
    lazy var forwardButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle( ">", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .light)
        button.tintColor = .blueMaroto
        button.setTitleColor(.blueMaroto, for: .normal)
        
        return button
    }()

}

extension SpacePhotoTableViewCell: Viewcode {
    
    func buildHierarchies() {
        contentView.addSubview(containerView)
        containerView.addSubview(labelsStackView)
        containerView.addSubview(forwardButton)
    }
    
    func addConstraints() {
        //containerView constraints
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
        //labelsStackView constraints
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        //forwardButton constraints
        NSLayoutConstraint.activate([
            forwardButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            forwardButton.centerYAnchor.constraint(equalTo: labelsStackView.centerYAnchor)
        ])
    }
    
    
    
    func applyAdditionalSetup() {
        backgroundColor = .clear
    }
    
    
}
