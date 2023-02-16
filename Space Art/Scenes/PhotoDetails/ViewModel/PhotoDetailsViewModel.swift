//
//  PhotoDetailsViewModel.swift
//  Space Art
//
//  Created by Jeovane Barbosa on 15/02/23.
//

import Foundation

protocol PhotoDetailsViewModelDelegate: AnyObject {
    func PhotoDetailsViewModel(viewModel: PhotoDetailsViewModel, chosenPhoto: Photo)
}

class PhotoDetailsViewModel {
    
    weak var delegate: PhotoDetailsViewModelDelegate?
    
    var photo: Photo?{
        didSet{
            guard let photo = photo else {return}
            delegate?.PhotoDetailsViewModel(viewModel: self, chosenPhoto: photo)
        }
    }
}
