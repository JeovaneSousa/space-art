//
//  PhotoDetailsViewController.swift
//  Space Art
//
//  Created by Jeovane Barbosa on 13/02/23.
//

import UIKit
import Kingfisher

class PhotoDetailsViewController: UIViewController {
    
    var photo: Photo? {
        didSet {
            guard let photo = photo,
                  let stringUrl = photo.url,
                  let url = URL(string: stringUrl) else {return}
            spacePhotoImageView.kf.setImage(with: url)
        }
    }
    
    override func viewDidLoad() {
        setupViewCode()
    }
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.backgroundColor = .clear
        
        stackView.addArrangedSubview(backButton)
        stackView.addArrangedSubview(containerStackView)
        
        return stackView
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(configuration: .plain())
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.tintColor = .white
        button.configuration?.image = .init(systemName: "chevron.backward")
        button.addTarget(self, action: #selector(popVc), for: .touchUpInside)
        
        return button
    }()
    
    @IBAction func popVc() {
        self.dismiss(animated: true)
    }
    
    private lazy var containerStackView: UIView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        stackView.addArrangedSubview(infoButton)
        stackView.addArrangedSubview(shareButton)

        return stackView
    }()
    
    private lazy var infoButton: UIButton = {
        let button = UIButton(configuration: .plain())
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.tintColor = .white
        button.configuration?.image = .init(systemName: "info.bubble.fill")
        
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton(configuration: .plain())
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.tintColor = .white
        button.configuration?.image = .init(systemName: "camera.fill")
        
        return button
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .darkMaroto
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        return view
    }()
    
    private lazy var spacePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()

    
}

extension PhotoDetailsViewController: Viewcode {
    func buildHierarchies() {
        view.addSubview(headerStackView)
        view.addSubview(separatorView)
        view.addSubview(spacePhotoImageView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerStackView.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            spacePhotoImageView.topAnchor.constraint(equalTo: view.topAnchor),
            spacePhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            spacePhotoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            spacePhotoImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func applyAdditionalSetup() {
        view.backgroundColor = .blueMaroto
        view.bringSubviewToFront(headerStackView)
    }
    
    
}
