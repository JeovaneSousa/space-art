//
//  SpacePhotosViewModel.swift
//  Space Art
//
//  Created by jeovane.barbosa on 28/12/22.
//

import Foundation

protocol SpacePhotosViewModelDelegate: AnyObject {
    func spacePhotosViewModel(_ viewModel: SpacePhotosViewModel, didLoadPhotos: [Photo])
}

class SpacePhotosViewModel {
    
    weak var delegate: SpacePhotosViewModelDelegate?
    var apodApi: APODApi?
    
    var photos: [Photo] = [] {
        didSet{
            delegate?.spacePhotosViewModel(self, didLoadPhotos: photos)
        }
    }
    
    func loadPhotos() {
        apodApi?.getPhotos(completionHandler: { [weak self] response in
            switch response {
                
            case .sucess(let newPhotos):
                self?.photos.append(contentsOf: newPhotos)
            
            case .failure(let error):
                print(error.errorDescription!)
            }
        })
    }
    
}
