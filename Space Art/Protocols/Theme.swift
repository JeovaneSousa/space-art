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
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationItem.setRightBarButton(UIBarButtonItem(customView: logoImageView()), animated: true)
        navigationItem.setLeftBarButton(UIBarButtonItem(customView: headerLabel()), animated: true)
        
    }
    
    fileprivate func headerLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = "Space Art"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        
        return label
    }
    
    fileprivate func logoImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .init(systemName: "moon.stars.fill")
        imageView.tintColor = .white


        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 18),
            imageView.widthAnchor.constraint(equalToConstant: 18)
        ])
        
        return imageView
    }
}

extension UIViewController: Theme {}
