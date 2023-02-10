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
    
    private static func homeTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .white
        tabBarController.tabBar.layer.masksToBounds = true
        tabBarController.tabBar.layer.cornerRadius = 48
        
        return tabBarController
    }
    private static func spaceController() -> UIViewController {
        let spaceController = SpacePhotosViewController()
        spaceController.spacePhotosViewModel = SpacePhotosViewModel()
        spaceController.spacePhotosViewModel?.apodApi = APODApi()
        //Set tab item
        spaceController.tabBarItem = UITabBarItem(title: "Space Photos", image: .actions, tag: 1)
        
        return spaceController
    }
    
    private static func favoritesController() -> UIViewController{
        let favoritesController = FavoritePhotosViewController()
        //Set tab item
        favoritesController.tabBarItem = UITabBarItem(title: "Favorites", image: .checkmark, tag: 2)
        
        return favoritesController
    }
    

        
}


