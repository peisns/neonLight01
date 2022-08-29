//
//  CalendarViewController.swift
//  neonLight01
//
//  Created by Brother Model on 2022/08/27.
//

import UIKit

class CalendarViewController: UIViewController {

    let mainView = CalendarView()
    
    override func loadView() {
        self.view = mainView
        mainView.vc = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        tabBarItem.title = "Calendar"

    }

    
}
