//
//  Coordinator.swift
//  Space Art
//
//  Created by Jeovane Barbosa on 09/02/23.
//

import Foundation
import UIKit

class Cordinator {

    static var homeTabBar: UITabBarController {
        return homeTabBarController()
    }
    static var spaceNavigationController: UINavigationController {
        return UINavigationController(rootViewController: spaceController())
    }
    static var favoritesNavigationController: UINavigationController {
        return UINavigationController(rootViewController: favoritesController())
    }
    static var photoDetailsViewController: UIViewController {
        return photoDetailsController()
    }
    static var photoDescriptionSheetPresentationController: UIViewController {
        return photoDescriptionSheetController()
    }
    
    static let commonViewModel = SpacePhotoAndFavoriteViewModel(withApi: APODApi())
    
    private static func homeTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .white
        tabBarController.tabBar.layer.masksToBounds = true
        
        return tabBarController
    }
    private static func spaceController() -> UIViewController {
        let spaceController = SpacePhotosViewController()
        spaceController.spacePhotosViewModel = commonViewModel
        
        //Set tab item
        spaceController.tabBarItem = UITabBarItem(title: "Space Photos", image: .init(systemName: "moon"), tag: 1)
        
        return spaceController
    }
    
    private static func favoritesController() -> UIViewController{
        let favoritesController = FavoritePhotosViewController()
        favoritesController.favoritePhotosViewModel = commonViewModel
        
        //Set tab item
        favoritesController.tabBarItem = UITabBarItem(title: "Favorites", image: .init(systemName: "star.leadinghalf.filled"), tag: 2)
        
        return favoritesController
    }
    
    private static func photoDetailsController() -> UIViewController {
        let photoDetailsController = PhotoDetailsViewController()
        photoDetailsController.photoDetailsViewModel = PhotoDetailsViewModel()
        
        return photoDetailsController
    }
    
    private static func photoDescriptionSheetController() -> UIViewController {
        let photoDescriptionController = PhotoDescriptionViewController()
    
        return photoDescriptionController
    }
    

        
}


