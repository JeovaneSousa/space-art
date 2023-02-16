//
//  FavoritePhotosViewController.swift
//  Space Art
//
//  Created by jeovane.barbosa on 27/12/22.
//

import UIKit

class FavoritePhotosViewController: UIViewController {

    var favoritePhotosViewModel: SpacePhotoAndFavoriteViewModel?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTheme()
        setupViewCode()
    }
    
//-----------------------------------------------------------------//
//MARK: - Implements FavoritePhotosViewController
//-----------------------------------------------------------------//
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.itemSize = .init(width: 80, height: 80)
        flowLayout.minimumInteritemSpacing = 20
        flowLayout.minimumLineSpacing = 24
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = .init(top: 12, left: 20, bottom: 12, right: 20)
        
        return flowLayout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FavoritePhotosCollectionViewCell.self,
                                forCellWithReuseIdentifier: FavoritePhotosCollectionViewCell.identifier)
        collectionView.backgroundColor = .blueMaroto
        
        return collectionView
    }()
}
    
//-----------------------------------------------------------------//
//MARK: - Implements CollectionView DataSource Protocol
//-----------------------------------------------------------------//
extension FavoritePhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoritePhotosViewModel?.favoritePhotos.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoritePhotosCollectionViewCell.identifier, for: indexPath) as? FavoritePhotosCollectionViewCell else {
            fatalError("Unable to acquire UICollectionViewCell")
        }
        
        let photo = favoritePhotosViewModel?.favoritePhotos[indexPath.row]
        cell.photo = photo
        
        return cell
    }
}

//-----------------------------------------------------------------//
//MARK: - Implements CollectionView Delegate Protocol
//-----------------------------------------------------------------//
extension FavoritePhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedPhoto = favoritePhotosViewModel?.favoritePhotos[indexPath.row]
        let photoDetailVc = Cordinator.photoDetailsViewController as! PhotoDetailsViewController
        photoDetailVc.modalPresentationStyle = .fullScreen
        
        self.present(photoDetailVc, animated: true) {
            photoDetailVc.photoDetailsViewModel?.photo = selectedPhoto
        }
    }
}

//-----------------------------------------------------------------//
//MARK: - Implements CollectionView FlowLayout Delegate
//-----------------------------------------------------------------//
extension FavoritePhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            fatalError("Unable to acquire FlowLayout to use for implementation.")
        }
      
        let margins = flowLayout.sectionInset
        let spacing = flowLayout.minimumInteritemSpacing
        let itemsPerLine: CGFloat = 2
        
        let utilArea = collectionView.bounds.width - ( margins.left + margins.right ) - spacing * ( itemsPerLine - 1 )
        let width = utilArea / itemsPerLine
        let height = width * 1.41
        
        return CGSize(width: width, height: height)
    }
}

//-----------------------------------------------------------------//
//MARK: - Implements Viewcode Protocol
//-----------------------------------------------------------------//
extension FavoritePhotosViewController: Viewcode {
    func buildHierarchies() {
        view.addSubview(collectionView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func applyAdditionalSetup() {
        view.backgroundColor = .clear
    }
    
    
}


