//
//  DiaryTableViewCell.swift
//  neonLight01
//
//  Created by Brother Model on 2022/08/28.
//

import UIKit

class DiaryTableViewCell: BaseTableViewCell {
    
    let cellView = BaseView().then {
        $0.backgroundColor = .black
        $0.layer.borderColor = UIColor.white.cgColor
        $0.layer.borderWidth = 2
        $0.layer.cornerRadius = 10
    }
    
    let dateLabel = BaseLabel().then {
        $0.text = "88년 12월 28일"
        $0.font = .boldSystemFont(ofSize: 16)
    }

    let titleLabel = BaseLabel().then {
        $0.text = "여기는 일기 제목이 들어가는 곳"
        $0.numberOfLines = 1
        $0.font = .boldSystemFont(ofSize: 16)
    }
    
    let regDateLabel = BaseLabel().then {
        $0.text = "88년 12월 28일"
        $0.font = .boldSystemFont(ofSize: 12)
        $0 .numberOfLines = 1
        $0.textColor = .systemGray
    }
    
    let likeButton = BaseButton().then {
        $0.setImage(UIImage(systemName: "heart"), for: .normal)
    }
    
    let bookmarkButton = BaseButton().then {
        $0.setImage(UIImage(systemName: "bookmark"), for: .normal)
    }
    
    let photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16 // spacing between cell's row
        layout.minimumInteritemSpacing = 16 // spacing between cell's column
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // between cells and another view
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 50, height: 80)
        var view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .black
        return view
    }()
    
    let contents = BaseLabel().then {
        $0.numberOfLines = 0
        $0.text = "여기에는 일기 내용이 들어가는 곳"
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 12)
        $0.backgroundColor = .black
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: DiaryTableViewCell.reuseIdentifier)
        
        configure()
        setConstraints()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func configure() {
        super.configure()
        self.backgroundColor = .black
        self.contentView.addSubview(cellView)
        
        [dateLabel, titleLabel, regDateLabel, likeButton, bookmarkButton, photoCollectionView, contents].forEach {cellView.addSubview($0)}
        
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        photoCollectionView.register(DiaryPhotoCollectionViewCell.self, forCellWithReuseIdentifier: DiaryPhotoCollectionViewCell.reuseIdentifier)

    }
    
    override func setConstraints() {
        let basicMargin: Float = 16
        
        super.setConstraints()
        cellView.snp.makeConstraints { make in
            make.edges.equalTo(self.contentView).inset(basicMargin)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(cellView.snp.top).inset(basicMargin)
            make.leading.trailing.equalTo(cellView).inset(basicMargin)
            make.height.equalTo(basicMargin * 2)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(basicMargin / 2)
            make.leading.trailing.equalTo(cellView).inset(basicMargin)
            make.height.equalTo(basicMargin * 2)
        }
        
        regDateLabel.snp.makeConstraints { make in
            make.trailing.equalTo(cellView).inset(basicMargin)
            make.bottom.equalTo(dateLabel.snp.bottom)
            make.top.equalTo(dateLabel.snp.top)
        }
        
        likeButton.snp.makeConstraints { make in
            make.width.height.equalTo(44)
            make.trailing.bottom.equalTo(cellView).inset(basicMargin)
        }
        
        bookmarkButton.snp.makeConstraints { make in
            make.width.equalTo(likeButton.snp.width)
            make.height.equalTo(likeButton.snp.height)
            make.trailing.equalTo(likeButton.snp.leading)
            make.bottom.equalTo(likeButton.snp.bottom)
        }
        
        photoCollectionView.snp.makeConstraints { make in
            make.leading.bottom.equalTo(cellView).inset(basicMargin)
            make.trailing.equalTo(bookmarkButton.snp.leading)
            make.height.height.equalTo(cellView.snp.height).multipliedBy(0.3)
        }
        
        contents.snp.makeConstraints { make in
            make.leading.trailing.equalTo(cellView).inset(basicMargin)
            make.top.equalTo(titleLabel.snp.bottom).offset(basicMargin)
            make.bottom.lessThanOrEqualTo(photoCollectionView.snp.top)
        }
    }
    
}

extension DiaryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiaryPhotoCollectionViewCell.reuseIdentifier, for: indexPath) as? DiaryPhotoCollectionViewCell else { return UICollectionViewCell()}
        cell.backgroundColor = .blue
        return cell
    }
}
