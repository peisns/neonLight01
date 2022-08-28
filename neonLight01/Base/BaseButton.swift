//
//  BaseButton.swift
//  neonLight01
//
//  Created by Brother Model on 2022/08/28.
//

import UIKit

class BaseButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setConfigure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setConfigure() {
        self.tintColor = .white
    }
}
