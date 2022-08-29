//
//  UIViewController+Extension.swift
//  neonLight01
//
//  Created by Brother Model on 2022/08/27.
//

import UIKit

protocol UIVC {
    func presentAlertOK(title: String, message: String?, style: UIAlertController.Style)
}

extension UIViewController: UIVC {
    func presentAlertOK(title: String, message: String?, style: UIAlertController.Style) {
        let AC = UIAlertController(title: title, message: message, preferredStyle: style)
        let ok = UIAlertAction(title: "OK", style: .default)
        AC.addAction(ok)
        present(AC, animated: true)
    }
}
