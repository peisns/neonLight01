//
//  BaseTextField.swift
//  neonLight01
//
//  Created by Brother Model on 2022/08/28.
//

import UIKit
import SnapKit

class BaseTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setConfigure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setConfigure() {
        self.layer.cornerRadius = 5
        self.backgroundColor = .systemGray6
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
        self.clearButtonMode = .whileEditing
        self.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(32)
        }
        
    }
}
