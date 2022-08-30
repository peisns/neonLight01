//
//  BaseView.swift
//  neonLight01
//
//  Created by Brother Model on 2022/08/28.
//

import UIKit

import RealmSwift
import SnapKit
import Then

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure() {
    }
    
    func setConstraints() {
        
    }


}
