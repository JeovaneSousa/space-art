//
//  SpacePhotosViewModel.swift
//  Space Art
//
//  Created by jeovane.barbosa on 28/12/22.
//

import Foundation

class SpacePhotosViewModel {
    
    var photos: [Photo] = []
    var apodApi: APODApi?
    
    init(apodApi: APODApi? = nil) {
        self.apodApi = apodApi
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
