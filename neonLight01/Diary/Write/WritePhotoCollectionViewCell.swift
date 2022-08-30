//
//  WritePhotoCollectionViewCell.swift
//  neonLight01
//
//  Created by Brother Model on 2022/08/28.
//

import UIKit

class WritePhotoCollectionViewCell: UICollectionViewCell {

    var photo = UIImageView().then {
        $0.image = UIImage(systemName: "star")
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConfigure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setConfigure() {
        self.addSubview(photo)
    }
    
    func setConstraints() {
        photo.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    
}
