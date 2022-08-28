//
//  BaseLabel.swift
//  neonLight01
//
//  Created by Brother Model on 2022/08/28.
//

import UIKit

class BaseLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure() {
        self.textColor = .white
    }
    
}
