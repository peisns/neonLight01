//
//  ViewController.swift
//  neonLight01
//
//  Created by Brother Model on 2022/07/06.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let vc = TabBarController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }

}

