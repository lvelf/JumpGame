//
//  UIViewControllerExtension.swift
//  JumpGame
//
//  Created by 诺诺诺诺诺 on 2022/10/2.
//

import UIKit

extension UIViewController {
    
    func alert(message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
        }

    }
}
