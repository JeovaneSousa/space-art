//
//  AppearenceSetup.swift
//  Space Art
//
//  Created by Jeovane Barbosa on 09/02/23.
//

import Foundation
import UIKit

extension SceneDelegate {
    func setupAppearence(){
        let appearence = UINavigationBarAppearance()
        appearence.backgroundColor = .blueMaroto
        UINavigationBar.appearance().scrollEdgeAppearance = appearence
        UINavigationBar.appearance().standardAppearance = appearence
        UINavigationBar.appearance().compactAppearance = appearence
        
        let tabAppearence = UITabBarAppearance()
        tabAppearence.backgroundColor = .darkMaroto
        UITabBar.appearance().scrollEdgeAppearance = tabAppearence
        UITabBar.appearance().standardAppearance = tabAppearence
    }
}
