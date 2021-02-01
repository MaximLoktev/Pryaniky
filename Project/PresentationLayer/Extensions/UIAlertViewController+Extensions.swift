//
//  UIAlertViewController+Extensions.swift
//  Pryaniky
//
//  Created by Максим Локтев on 01.02.2021.
//

import UIKit

extension UIAlertController {
    
    class func alert(title: String?, message: String, cancel: String) -> Self {
        let alertController = self.init(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: cancel, style: .cancel))
        return alertController
    }
}

