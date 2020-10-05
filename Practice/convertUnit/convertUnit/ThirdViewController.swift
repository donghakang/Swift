//
//  ThirdViewController.swift
//  convertUnit
//
//  Created by Dongha Kang on 2020/09/02.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    let ap = UIApplication.shared.delegate as! AppDelegate
    
    func toChuck(cm: Double) -> Double {
        return cm * 0.33
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dataTextField.text = String(toChuck(cm: ap.cmValue))
    }
    
    @IBAction func tapInput(_ sender: Any) {
        // 버튼 누를시 키보드가 없어진다.
        dataTextField.resignFirstResponder()
        
        if let text = dataTextField.text {
            // 텍스트에 필드 값이 있을때...
            if let chuckValue = Double(text) {
                ap.cmValue = chuckValue / 0.33
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
