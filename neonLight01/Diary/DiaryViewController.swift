//
//  DiaryViewController.swift
//  neonLight01
//
//  Created by Brother Model on 2022/08/27.
//

import UIKit

class DiaryViewController: UIViewController {

    let mainView = DiaryView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setNav()
    }
    
    func configure() {
    }

    func setNav() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .black
        navBarAppearance.shadowColor = .clear // underline color
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white] // title color
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationItem.title = "Diary"
        
        var navPlusBtnConfig = UIButton.Configuration.plain()
        navPlusBtnConfig.image = UIImage(systemName: "plus.square.fill")
        navPlusBtnConfig.baseForegroundColor = .white // tint
        navPlusBtnConfig.background.backgroundColor = .black // background
        navPlusBtnConfig.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 20)
        let navPlusBtn = UIButton(configuration: navPlusBtnConfig)
        navPlusBtn.addTarget(self, action: #selector(pushToWriteV) , for: .touchUpInside)
        let navPlusBarBtn = UIBarButtonItem(customView: navPlusBtn)
        navigationItem.rightBarButtonItems = [navPlusBarBtn]
    }
    
    @objc func pushToWriteV() {
        let vc = WriteViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
