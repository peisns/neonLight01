//
//  DiaryPhotoCollectionViewCell.swift
//  neonLight01
//
//  Created by Brother Model on 2022/08/28.
//

import UIKit

class DiaryPhotoCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setConfigure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setConfigure() {
        self.contentView.backgroundColor = .white
    }
}

