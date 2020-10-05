//
//  SecondViewController.swift
//  convertUnit
//
//  Created by Dongha Kang on 2020/09/02.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    
    let ap = UIApplication.shared.delegate as! AppDelegate
    
    
    
    func toInch(cm: Double) -> Double {
        return cm * 0.3937
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let inchValue = toInch(cm: ap.cmValue)
        dataTextField.text = String(inchValue)
    }

    @IBAction func tapInput(_ sender: Any) {
        // 버튼 누를시 키보드가 없어진다.
        dataTextField.resignFirstResponder()
        
        if let text = dataTextField.text {
            // 텍스트에 필드 값이 있을때...
            if let inchValue = Double(text) {
                ap.cmValue = inchValue / 0.3937
            }
        }
        
    }
    
}

