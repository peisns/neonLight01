//
//  UIView+Extension.swift
//  neonLight01
//
//  Created by Brother Model on 2022/08/29.
//

import UIKit

//protocol UIV {
//    func presentAlertOK(title: String, message: String?, style: UIAlertController.Style)
//}

extension UIView { //UIV {
    func presentAlertOK(title: String, message: String?, style: UIAlertController.Style, vc: UIViewController) {
        let AC = UIAlertController(title: title, message: message, preferredStyle: style)
        let ok = UIAlertAction(title: "OK", style: .default)
        AC.addAction(ok)
        vc.present(AC, animated: true)
    }
}
