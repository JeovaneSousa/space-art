//
//  SpacePhotoTableViewCell.swift
//  Space Art
//
//  Created by jeovane.barbosa on 28/12/22.
//

import UIKit

class SpacePhotoTableViewCell: UITableViewCell {

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
        view.backgroundColor = .grayMaroto
        
        return view
    }()
    
    lazy
    

}

extension SpacePhotoTableViewCell: Viewcode {
    func buildHierarchies() {
        contentView.addSubview(containerView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    func applyAdditionalSetup() {
        backgroundColor = .clear
    }
    
    
}
