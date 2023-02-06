//
//  ViewController.swift
//  Space Art
//
//  Created by jeovane.barbosa on 27/12/22.
//

import UIKit



class SpacePhotosViewController: UIViewController {

    var spacePhotosViewModel: SpacePhotosViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewCode()
        spacePhotosViewModel?.loadPhotos()
        setupTheme()
        
    }
    
    
//    lazy var navigationBar: UINavigationBar = {
//        let navigationbar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 110))
//        navigationbar.backgroundColor = .darkMaroto
//        
//        let appearence = UINavigationBarAppearance()
//        appearence.titleTextAttributes = [.font: UIFont(name: "Georgia-bold", size: 20)!,
//                                       .foregroundColor: UIColor.white]
//        navigationItem.standardAppearance = appearence
//        
//        navigationItem.title = "NASA Photo Of The Day"
//        
//        return navigationbar
//    }()
    
    lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.delegate = self
        tableview.dataSource = self
        spacePhotosViewModel?.delegate = self
        tableview.backgroundColor = .clear
        tableview.register(SpacePhotoTableViewCell.self, forCellReuseIdentifier: SpacePhotoTableViewCell.identifier)
        
        return tableview
    }()
    
}

//MARK: - Implements delegate
extension SpacePhotosViewController: SpacePhotosViewModelDelegate {
    
    func spacePhotosViewModel(_ viewModel: SpacePhotosViewModel, didLoadPhotos: [Photo]) {
        tableView.reloadData()
    }
    
    func spacePhotosViewModel(_ viewModel: SpacePhotosViewModel, errorOccurred: ApiError) {
        alertError(withMessage: errorOccurred.errorMessage!)
    }
}

//MARK: - Implements tableView related protocols
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

extension SpacePhotosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


//MARK: - Implements the Viewcode protocol
extension SpacePhotosViewController: Viewcode {
    func buildHierarchies() {
        view.addSubview(navigationBar)
        view.addSubview(tableView)
    }
    
    func addConstraints() {
        //Tableview Contraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
    func applyAdditionalSetup() {
    }
    
    
}
