//
//  DiaryView.swift
//  neonLight01
//
//  Created by Brother Model on 2022/08/27.
//

import UIKit

class DiaryView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure() {
        backgroundColor = .white
    }
    
    func setConstraints() {
        
    }
}
