//
//  ViewController.swift
//  UIAlertController
//
//  Created by Dongha Kang on 2020/10/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.title = "타이틀"
        alert.message = "메시지"
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            (action) -> Void in
            self.hello(action.title!)
        }))
        
        alert.addAction(UIAlertAction(title: "버튼2 입니다", style: .default, handler: {
            (action) -> Void in
            self.hello(action.title!)
        }))

        // 빨간색 버튼
        alert.addAction(UIAlertAction(title: "버튼3 입니다", style: .destructive, handler: {
            (action) -> Void in
            self.hello(action.title!)
        }))

//        // 텍스트 필드 setup
//        alert.addTextField{(textField) -> Void in
//            textField.delegate = self
//        }
        
        // 취소 버튼
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))

        
        self.present(alert, animated: true, completion: {
            print("알람이 표시되었습니다.")
        })
    }
    func hello(_ msg: String) {
        print(msg)
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        print(textField.text!)
//    }
}

