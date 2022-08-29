//
//  WriteView.swift
//  neonLight01
//
//  Created by Brother Model on 2022/08/27.
//

import UIKit
import PhotosUI

class WriteView: BaseView {
    
    var vc = UIViewController()
    
    let mainScrollView = UIScrollView().then {
        $0.backgroundColor = .black
    }
    
    // Frame Layout Guide 는 scroll View 객체 자체의 크기를 의미
    // content layout guide는 안에 들어가는 컨텐츠의 크기
    // uicollectionviewdelegateFlowlayout 프로토콜 추가
    // size for item at
    
    let mainView = BaseView().then {
        $0.backgroundColor = .systemGray
    }
    
    let dateView = BaseView().then { _ in }
    
    let dateLabel = BaseLabel().then { $0.text = "날짜" }
    
    let datePicker = UIDatePicker().then {
        $0.preferredDatePickerStyle = .compact
        $0.datePickerMode = .date
        $0.backgroundColor = .systemGray6
        $0.tintColor = .black
        $0.maximumDate = Date()
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
    }
    
    let titleLabel = BaseLabel().then {
        $0.text = "간단한 제목"
    }
    
    let titleTextField = BaseTextField().then {
        $0.placeholder = "하루가 괜찮았나요?"
    }
    
    let contentsLabel = BaseLabel().then {
        $0.text = "당신의 하루 이야기,"
    }
    
    let contentsTextView = UITextView().then {
        $0.layer.cornerRadius = 5
        $0.backgroundColor = .systemGray6
    }
        
    let selectPhotoBtn = BaseButton().then {
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.layer.borderColor = UIColor.systemGray6.cgColor
        $0.layer.borderWidth = 2
        $0.layer.cornerRadius = 5
    }
    
    let photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16 // spacing between cell's row
        layout.minimumInteritemSpacing = 16 // spacing between cell's column
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // between cells and another view
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 100, height: 140)
        var view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .black
        return view
    }()
    
    let photoPicker: PHPickerViewController = {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .images
        let picker = PHPickerViewController(configuration: configuration)
        return picker
    }()
    
    let saveButton = BaseButton().then {
        $0.setTitle("Save Diary", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 5
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func configure() {
        super.configure()
        backgroundColor = .black
        
        self.addSubview(mainScrollView)
        
        mainScrollView.addSubview(mainView)
        
        [dateLabel, datePicker].forEach {dateView.addSubview($0)}
        [dateView, titleLabel, titleTextField, contentsLabel, contentsTextView, selectPhotoBtn, photoCollectionView, saveButton].forEach {mainView.addSubview($0)}
                
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        photoCollectionView.register(WritePhotoCollectionViewCell.self, forCellWithReuseIdentifier: WritePhotoCollectionViewCell.reuseIdentifier)
        
        photoPicker.delegate = self
        
        selectPhotoBtn.addTarget(self, action: #selector(selectPhotoBtnClicked), for: .touchUpInside)
        
        saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
    }
    
    @objc func selectPhotoBtnClicked() {
        vc.present(photoPicker, animated: true)
    }
    
    @objc func saveButtonClicked() {
        
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        let basicMargin = 16
        
        mainScrollView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        mainView.snp.makeConstraints { make in
            make.edges.equalTo(mainScrollView)
            make.width.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(self.safeAreaLayoutGuide).offset(200)
        }
        
        dateView.snp.makeConstraints { make in
            make.top.equalTo(mainView).inset(basicMargin * 2)
            make.leading.trailing.equalTo(mainView).inset(basicMargin)
            make.height.equalTo(44)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(dateView)
            make.centerY.equalTo(dateView)
        }
        
        datePicker.snp.makeConstraints { make in
            make.trailing.equalTo(dateView)
            make.centerY.equalTo(dateView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(dateView.snp.bottom).offset(basicMargin)
            make.leading.trailing.equalTo(mainView).inset(basicMargin)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(basicMargin)
            make.leading.trailing.equalTo(mainView).inset(basicMargin)
        }
        
        contentsLabel.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(basicMargin)
            make.leading.trailing.equalTo(mainView).inset(basicMargin)
        }
        
        contentsTextView.snp.makeConstraints { make in
            make.top.equalTo(contentsLabel.snp.bottom).offset(basicMargin)
            make.leading.trailing.equalTo(mainView).inset(basicMargin)
            make.height.equalTo(200)
        }
        
        selectPhotoBtn.snp.makeConstraints { make in
            make.top.equalTo(contentsTextView.snp.bottom).offset(basicMargin)
            make.leading.equalTo(mainView).inset(basicMargin)
            make.width.equalTo(100)
            make.height.equalTo(140)
        }
        
        photoCollectionView.snp.makeConstraints { make in
            make.top.equalTo(contentsTextView.snp.bottom).offset(basicMargin)
            make.trailing.equalTo(mainView)
            make.leading.equalTo(selectPhotoBtn.snp.trailing).offset(basicMargin)
            make.height.equalTo(140)
        }
        
        saveButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(mainView).inset(basicMargin)
            make.top.equalTo(photoCollectionView.snp.bottom).offset(basicMargin * 2)
            make.height.equalTo(44)
        }
    }
}

extension WriteView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WritePhotoCollectionViewCell.reuseIdentifier, for: indexPath) as? WritePhotoCollectionViewCell else { return UICollectionViewCell() }
        cell.backgroundColor = .white
        return cell
    }
}

extension WriteView: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        print(results)
    }
}
