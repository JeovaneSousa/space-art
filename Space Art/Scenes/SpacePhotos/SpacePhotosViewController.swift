//
//  ViewController.swift
//  Space Art
//
//  Created by jeovane.barbosa on 27/12/22.
//

import UIKit



class SpacePhotosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewCode()
    }
    
    
    lazy var navigationBar: UINavigationBar = {
        let navigationbar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 110))
        navigationbar.backgroundColor = .darkMaroto
        
        let appearence = UINavigationBarAppearance()
        appearence.titleTextAttributes = [.font: UIFont(name: "Georgia-bold", size: 20)!,
                                       .foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearence
        
        navigationItem.title = "NASA Photo Of The Day"
        
        return navigationbar
    }()
    
    lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.delegate = self
        tableview.dataSource = self
        tableview.backgroundColor = .clear
        tableview.rowHeight = 150
        tableview.estimatedRowHeight = 150
        tableview.register(SpacePhotoTableViewCell.self, forCellReuseIdentifier: SpacePhotoTableViewCell.identifier)
        
        return tableview
    }()
    
}

extension SpacePhotosViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SpacePhotoTableViewCell.identifier, for: indexPath) as? SpacePhotoTableViewCell else {
            fatalError("Unable to acquire cell with identifier \(SpacePhotoTableViewCell.identifier) to present")
        }
        
        return cell
    }
    
    
}

extension SpacePhotosViewController: UITableViewDelegate {
    
}



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
        view.backgroundColor = .blueMaroto
    }
    
    
}
