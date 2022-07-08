//
//  ViewController.swift
//  neonLight01
//
//  Created by Brother Model on 2022/07/06.
//

import UIKit

class LedViewController: UIViewController {
    
    @IBOutlet weak var textColorButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var userTextField: UITextField!
        
    @IBOutlet weak var resultLabel: UILabel!

    @IBOutlet var mainButtonCollection: [UIButton]!
    
    @IBOutlet weak var toggledTopView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userTextField.placeholder = "내용을 작성해 주세요"
        userTextField.text = "내용을 작성해 주세요"
        
        designMainButtonCollection(sendButton, normalTitle: "전송", highlightedTitle: "전송 중")
        designMainButtonCollection(textColorButton, normalTitle: "색깔", highlightedTitle: "바꾸는중")
        
        for i in mainButtonCollection {
            i.backgroundColor = .black
            i.layer.borderColor = UIColor.white.cgColor
            i.layer.borderWidth = 1
            i.layer.cornerRadius = 5
            i.setTitleColor(.white, for: .normal) // setTitle 설정이 선행되어야 함
            i.setTitleColor(.red, for: .highlighted)
        }
        
    }
    
    func designMainButtonCollection(_ buttonName: UIButton, normalTitle: String, highlightedTitle: String){
        buttonName.setTitle(normalTitle, for: .normal)
        buttonName.setTitle(highlightedTitle, for: .highlighted)
    }
    
    @IBAction func sendUserText(_ sender: Any) {
        resultLabel.text = userTextField.text
        userTextField.text = ""
    }
    
    @IBAction func clearKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func hideTopView(_ sender: Any) {
        if toggledTopView.isHidden == true {
            toggledTopView.isHidden = false
        } else {
            toggledTopView.isHidden = true
        }
    }
    
    
    
//
//        if sendButton.isHidden == true {
//            sendButton.isHidden = false
//        } else {
//            sendButton.isHidden = true
//        }
//
//        if textColorButton.isHidden == true {
//            textColorButton.isHidden = false
//        } else {
//            textColorButton.isHidden = true
//        }

    
    
}

