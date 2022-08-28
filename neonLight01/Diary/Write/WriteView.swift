//
//  WriteView.swift
//  neonLight01
//
//  Created by Brother Model on 2022/08/27.
//

import UIKit

class WriteView: UIView {
        
    let titleLabel = UILabel().then {
        $0.text = "간단한 제목"
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    let titleTextField = BaseTextField().then {
        $0.placeholder = "하루가 괜찮았나요?"
    }
    
//    let datePicker = UIDatePicker().then {
//
//    }
    
    let contentsLabel = UILabel().then {
        $0.text = "당신의 하루 이야기,"
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    let contentsTextView = UITextView().then {
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .systemGray6
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure() {
        backgroundColor = .black
        
        [titleLabel, titleTextField, contentsLabel, contentsTextView].forEach {self.addSubview($0)}
    }
    
    func setConstraints() {
        let basicMargin = 16
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(basicMargin * 2)
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(basicMargin)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(basicMargin)
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(basicMargin)
        }
        
        contentsLabel.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(basicMargin)
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(basicMargin)
        }
        
        contentsTextView.snp.makeConstraints { make in
            make.top.equalTo(contentsLabel.snp.bottom).offset(basicMargin)
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(basicMargin)
            make.height.equalTo(200)
        }
    }
}
