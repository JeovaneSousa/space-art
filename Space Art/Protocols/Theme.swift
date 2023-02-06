//
//  Theme.swift
//  Space Art
//
//  Created by Jeovane Barbosa on 06/02/23.
//
import UIKit
import Foundation

protocol Theme: UIViewController {
    func setupTheme()
}

extension Theme {
    func setupTheme(){
        view.backgroundColor = .black
        setupTitleView()
    }
    
    func setupTitleView() {
        var uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.layer.masksToBounds = true
        uiView.layer.cornerRadius = 8
        
        var containerStackView = UIStackView()
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.isLayoutMarginsRelativeArrangement = true
        containerStackView.layoutMargins = .init(top: 5, left: 20, bottom: 20, right: 20)
        containerStackView.axis = .horizontal
        containerStackView.distribution = .equalCentering
        containerStackView.alignment = .fill
        
        containerStackView.addArrangedSubview(uiView)
        
        NSLayoutConstraint.activate([
            uiView.topAnchor.constraint(equalTo: containerStackView.topAnchor),
            uiView.leadingAnchor.constraint(equalTo: containerStackView.leadingAnchor),
            uiView.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor),
            uiView.bottomAnchor.constraint(equalTo: containerStackView.bottomAnchor)
        ])

        
        
    }
    
}

extension UIViewController: Theme {}
