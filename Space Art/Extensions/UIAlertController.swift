//
//  UIAlertController.swift
//  Space Art
//
//  Created by Ada Diniz on 29/12/22.
//

import Foundation
import UIKit

extension UIAlertController {
    static func showAlert(withTitle title: String, andMessage message: String, withVC viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        viewController.present(alert, animated: true)
    }
}
