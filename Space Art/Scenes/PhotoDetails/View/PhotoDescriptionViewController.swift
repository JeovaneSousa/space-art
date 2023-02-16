//
//  PhotoDescriptionViewController.swift
//  Space Art
//
//  Created by Jeovane Barbosa on 14/02/23.
//

import UIKit

class PhotoDescriptionViewController: UIViewController, UISheetPresentationControllerDelegate {
    
    var photo: Photo? {
        didSet {
            guard let photo = photo else {return}
            titleLabel.text = photo.title
            descriptionLabel.text = photo.explanation
        }
    }
    
    override var sheetPresentationController: UISheetPresentationController? {
        (presentationController as! UISheetPresentationController)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewCode()
        setupSheetPresentation()
    }
    
//-----------------------------------------------------------------//
//MARK: - Implements PhotoDescriptionViewController
//-----------------------------------------------------------------//
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 10, left: 20, bottom: 10, right: 20)
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 12
        stackView.backgroundColor = .darkMaroto
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 40
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.numberOfLines = 0
        label.text = ""
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = ""
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .justified
        
        return label
    }()
    
//-----------------------------------------------------------------//
//MARK: - Implements Helper Methods
//-----------------------------------------------------------------//
    private func setupSheetPresentation() {
        sheetPresentationController?.delegate = self
        sheetPresentationController?.detents = [.medium(),
                                                .large()]
        sheetPresentationController?.prefersGrabberVisible = true
        sheetPresentationController?.preferredCornerRadius = 20
    }
}

//-----------------------------------------------------------------//
//MARK: - Implements Viewcode Protocol
//-----------------------------------------------------------------//
extension PhotoDescriptionViewController: Viewcode {
    func buildHierarchies() {
        view.addSubview(containerStackView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            containerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            containerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            containerStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
    func applyAdditionalSetup() {

    }
    
    
}
