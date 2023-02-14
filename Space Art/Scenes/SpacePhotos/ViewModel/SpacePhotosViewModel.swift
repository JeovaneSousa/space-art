//
//  SpacePhotosViewModel.swift
//  Space Art
//
//  Created by jeovane.barbosa on 28/12/22.
//

import Foundation

protocol SpacePhotosViewModelDelegate: AnyObject {
    func spacePhotosViewModel(_ viewModel: SpacePhotosViewModel, didLoadPhotos: [Photo])
    func spacePhotosViewModel(_ viewModel: SpacePhotosViewModel, errorOccurred: ApiError)
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
        apodApi?.getPhotos { [weak self] (result: ApiResult<[Photo]>) in
            
            guard let self = self else { return }
            switch result {
                
            case .success(let photos):
                photos.forEach{
                    $0.isLiked = Bool.random()
                    $0.isFavorited = false
                }
                
                self.photos.append(contentsOf: photos)
                
            case .failure(let error):
                debugPrint(error.errorMessage!)
                self.delegate?.spacePhotosViewModel(self, errorOccurred: error)
            }
        }
    }
    
}
