//
//  FirstViewController.swift
//  convertUnit
//
//  Created by Dongha Kang on 2020/09/02.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    
    // AppDelegate에서 접근할 수 있도록 객체를 생성
    let ap = UIApplication.shared.delegate as! AppDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        dataTextField.text = String(ap.cmValue)
    }
    
    
    @IBAction func tapInput(_ sender: Any) {
        
        // 버튼 누를시 키보드가 없어진다.
        dataTextField.resignFirstResponder()
        
        if let text = dataTextField.text {
            // 텍스트에 필드 값이 있을때...
            if let cmValue = Double(text) {
                ap.cmValue = cmValue
            }
        }
        
    }
    
}

