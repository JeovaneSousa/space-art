//
//  SpacePhotosViewModel.swift
//  Space Art
//
//  Created by jeovane.barbosa on 28/12/22.
//

protocol SpacePhotoAndFavoriteViewModelDelegate: AnyObject {
    func SpacePhotoAndFavoriteViewModel(_ viewModel: SpacePhotoAndFavoriteViewModel, didLoadPhotos: [Photo])
    func SpacePhotoAndFavoriteViewModel(_ viewModel: SpacePhotoAndFavoriteViewModel, errorOccurred: ApiError)
}

class SpacePhotoAndFavoriteViewModel {
    
    init(withApi api: APODApi) {
        self.apodApi = api
    }
    
    weak var delegate: SpacePhotoAndFavoriteViewModelDelegate?
    var apodApi: APODApi?
    
    var photos: [Photo] = [] {
        didSet{
            delegate?.SpacePhotoAndFavoriteViewModel(self, didLoadPhotos: photos)
        }
    }
    
    var favoritePhotos: [Photo] {
        return photos.filter {$0.isFavorited!}
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
                
                let onlyPhotos = photos.filter {$0.mediaType == "image"}
                self.photos.append(contentsOf: onlyPhotos)
                
            case .failure(let error):
                debugPrint(error.errorMessage!)
                self.delegate?.SpacePhotoAndFavoriteViewModel(self, errorOccurred: error)
            }
        }
    }
    
}
