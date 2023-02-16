//
//  PhotoDetailsViewController.swift
//  Space Art
//
//  Created by Jeovane Barbosa on 13/02/23.
//

import UIKit
import Kingfisher

class PhotoDetailsViewController: UIViewController {
    
    var photoDetailsViewModel: PhotoDetailsViewModel?
    
    override func viewWillAppear(_ animated: Bool) {
        photoDetailsViewModel?.delegate = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        setupViewCode()
    }
    
//-----------------------------------------------------------------//
//MARK: - Implements PhotoDetailsViewController
//-----------------------------------------------------------------//
    private lazy var statusBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.1)
        
        return view
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.backgroundColor = .clear
        stackView.backgroundColor = UIColor(white: 0.0, alpha: 0.1)
        
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
    
    private lazy var containerStackView: UIView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        stackView.addArrangedSubview(infoButton)
        stackView.addArrangedSubview(screenShotButton)
        
        return stackView
    }()
    
    private lazy var infoButton: UIButton = {
        let button = UIButton(configuration: .plain())
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.tintColor = .white
        button.configuration?.image = .init(systemName: "info.bubble.fill")
        button.addTarget(self, action: #selector(showDescription), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var screenShotButton: UIButton = {
        let button = UIButton(configuration: .plain())
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.tintColor = .white
        button.configuration?.image = .init(systemName: "camera.fill")
        button.addTarget(self, action: #selector(takeScreenshot), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var spacePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
}

//-----------------------------------------------------------------//
//MARK: - Implements Delegate
//-----------------------------------------------------------------//
extension PhotoDetailsViewController: PhotoDetailsViewModelDelegate {
    func PhotoDetailsViewModel(viewModel: PhotoDetailsViewModel, chosenPhoto: Photo) {
        setupForNewPhoto(photo: chosenPhoto)
    }
}

//-----------------------------------------------------------------//
//MARK: - Implements Helper Methods
//-----------------------------------------------------------------//
extension PhotoDetailsViewController {
    @IBAction func popVc() {
        self.dismiss(animated: true)
    }
    
    @IBAction private func showDescription() {
        let descriptionVc = Cordinator.photoDescriptionSheetPresentationController as! PhotoDescriptionViewController
        descriptionVc.modalPresentationStyle = .pageSheet
        descriptionVc.photo = self.photoDetailsViewModel?.photo
        self.present(descriptionVc, animated: true)
    }
    
    @IBAction private func takeScreenshot(){
        UIGraphicsBeginImageContextWithOptions(spacePhotoImageView.bounds.size, false, 0.0)
        spacePhotoImageView.drawHierarchy(in: spacePhotoImageView.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
    }
    
    private func setupForNewPhoto(photo: Photo?) {
        guard let photo = photo,
              let stringUrl = photo.url,
              let url = URL(string: stringUrl) else {return}
        spacePhotoImageView.kf.setImage(with: url)
    }
}

//-----------------------------------------------------------------//
//MARK: - Implements Viewcode Protocol
//-----------------------------------------------------------------//
extension PhotoDetailsViewController: Viewcode {
    func buildHierarchies() {
        view.addSubview(headerStackView)
        view.addSubview(statusBarView)
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
            statusBarView.topAnchor.constraint(equalTo: view.topAnchor),
            statusBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusBarView.bottomAnchor.constraint(equalTo: headerStackView.topAnchor)
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
        view.bringSubviewToFront(statusBarView)
    }
    
    
}
