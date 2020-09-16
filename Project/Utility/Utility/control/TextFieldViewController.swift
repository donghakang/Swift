//
//  TextFieldViewController.swift
//  Utility
//
//  Created by Dongha Kang on 2020/09/16.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class TextFieldViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var numTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numTextField.placeholder = "개수를 넣는다"
        numTextField.keyboardType = .numberPad
        numTextField.clearButtonMode = .whileEditing
        numTextField.text = "0"
        numTextField.delegate = self
        
        emailTextField.placeholder = "이메일을 입력하세요"
        emailTextField.keyboardType = .emailAddress
        emailTextField.clearButtonMode = .whileEditing
        emailTextField.delegate = self
        
        myLabel.text = "0"
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // 텍스트 빌드 중에 값이 변경되면 다시 계산한다.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField == numTextField) {
            let tmpStr = textField.text! as NSString
            let replacedString = tmpStr.replacingCharacters(in: range, with: string)
            if replacedString == "" {
                myLabel.text = "0"
            } else {
                if let num = Int(replacedString) {
                    myLabel.text = String(num)
                }
            }
        } else if (textField == emailTextField) {
            let tmpStr = textField.text! as NSString
            let replacedString = tmpStr.replacingCharacters(in: range, with: string)
            if replacedString == "" {
                emailLabel.text = "Insert Email"
            } else {
                emailLabel.text = replacedString
            }
        }
        
        
        return true
    }
    
    // 클리어 버튼을 눌렀을때는 0이 된다
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if textField == numTextField {
            myLabel.text = "0"
        } else if textField == emailTextField {
            emailLabel.text = "Insert Email"
        }
        
        return true
    }
    

}
