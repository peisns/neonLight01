//
//  BaseTableViewCell.swift
//  neonLight01
//
//  Created by Brother Model on 2022/08/28.
//

import UIKit

import SnapKit
import Then

class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: BaseTableViewCell.reuseIdentifier)
        
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
