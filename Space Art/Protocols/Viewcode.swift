//
//  TabItemSetup.swift
//  Space Art
//
//  Created by jeovane.barbosa on 28/12/22.
//

import Foundation

protocol Viewcode {
    func setupViewCode()
    func buildHierarchies()
    func addConstraints()
    func applyAdditionalSetup()
}

extension Viewcode {
    func setupViewCode() {
        buildHierarchies()
        addConstraints()
        applyAdditionalSetup()
    }
}
