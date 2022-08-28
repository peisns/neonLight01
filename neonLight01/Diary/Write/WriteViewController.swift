//
//  WriteViewController.swift
//  neonLight01
//
//  Created by Brother Model on 2022/08/27.
//

import UIKit

class WriteViewController: UIViewController {

    let mainView = WriteView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        navigationItem.title = "Write"
        
        
    }

}
