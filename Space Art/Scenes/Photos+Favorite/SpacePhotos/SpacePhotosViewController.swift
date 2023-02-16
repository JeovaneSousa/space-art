//
//  ViewController.swift
//  Space Art
//
//  Created by jeovane.barbosa on 27/12/22.
//

import UIKit



class SpacePhotosViewController: UIViewController {

    var spacePhotosViewModel: SpacePhotoAndFavoriteViewModel?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTheme()
        setupViewCode()
        spacePhotosViewModel?.loadPhotos()
    }
    
//-----------------------------------------------------------------//
//MARK: - Implements SpacePhotosViewController
//-----------------------------------------------------------------//
    private lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.delegate = self
        tableview.dataSource = self
        spacePhotosViewModel?.delegate = self
        tableview.estimatedRowHeight = 120
        tableview.backgroundColor = .clear
        tableview.register(SpacePhotoTableViewCell.self, forCellReuseIdentifier: SpacePhotoTableViewCell.identifier)
        
        return tableview
    }()
}

//-----------------------------------------------------------------//
//MARK: - Implements Tableview DataSource Protocol
//-----------------------------------------------------------------//
extension SpacePhotosViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spacePhotosViewModel?.photos.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SpacePhotoTableViewCell.identifier, for: indexPath) as? SpacePhotoTableViewCell else {
            fatalError("Unable to acquire cell with identifier \(SpacePhotoTableViewCell.identifier) to present")
        }

        cell.photo = spacePhotosViewModel?.photos[indexPath.row]
        return cell
    }
}

//-----------------------------------------------------------------//
//MARK: - Implements TableView Delegate Protocol
//-----------------------------------------------------------------//
extension SpacePhotosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
       
        let selectedPhoto = spacePhotosViewModel!.photos[indexPath.row]
        let detailsController = Cordinator.photoDetailsViewController as! PhotoDetailsViewController
        detailsController.modalPresentationStyle = .fullScreen
        
        self.present(detailsController, animated: true) {
            detailsController.photoDetailsViewModel?.photo = selectedPhoto
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let spacePhotosViewModel = spacePhotosViewModel else {return}
        let lastIndex = spacePhotosViewModel.photos.count - 1
        
        if lastIndex == indexPath.row {
            spacePhotosViewModel.loadPhotos()
            debugPrint("Fetching more photos.")
        }
    }
}

//-----------------------------------------------------------------//
//MARK: - Implements Delegate
//-----------------------------------------------------------------//
extension SpacePhotosViewController: SpacePhotoAndFavoriteViewModelDelegate {
    func SpacePhotoAndFavoriteViewModel(_ viewModel: SpacePhotoAndFavoriteViewModel, didLoadPhotos: [Photo]) {
        tableView.reloadData()
    }
    
    func SpacePhotoAndFavoriteViewModel(_ viewModel: SpacePhotoAndFavoriteViewModel, errorOccurred: ApiError) {
        alertError(withMessage: errorOccurred.errorMessage!)
    }
}

//-----------------------------------------------------------------//
//MARK: - Implements Viewcode Protocol
//-----------------------------------------------------------------//
extension SpacePhotosViewController: Viewcode {
    func buildHierarchies() {
        view.addSubview(tableView)
    }
    
    func addConstraints() {
        //Tableview Contraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    func applyAdditionalSetup() {
        view.backgroundColor = .blueMaroto
    }
    
    
}
