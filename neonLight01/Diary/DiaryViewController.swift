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
        navBarAppearance.shadowColor = .systemGray // underline color
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white] // title color
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationItem.title = "Diary"
        self.navigationController?.navigationBar.tintColor = .white

        
        var navPlusBtnConfig = UIButton.Configuration.plain()
        navPlusBtnConfig.image = UIImage(systemName: "plus.square.fill")
        navPlusBtnConfig.background.backgroundColor = .black // background
        navPlusBtnConfig.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 20)
        let navPlusBtn = UIButton(configuration: navPlusBtnConfig)
        navPlusBtn.addTarget(self, action: #selector(pushToWriteV) , for: .touchUpInside)
        let navPlusBarBtn = UIBarButtonItem(customView: navPlusBtn)
        navigationItem.rightBarButtonItems = [navPlusBarBtn]
        
        let navBarBackBtn = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = navBarBackBtn

    }

    @objc func pushToWriteV() {
        let vc = WriteViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
