//
//  BoolViewController.swift
//  User Default
//
//  Created by Dongha Kang on 2020/10/25.
//

import UIKit

class BoolViewController: UIViewController {
    @IBOutlet weak var mySwitch1: UISwitch!
    @IBOutlet weak var mySwitch2: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveStatus(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(mySwitch1.isOn, forKey: "switchOn")        // switchOn 키로 지정해 저장.
    }
    
    @IBAction func readStatus(_ sender: Any) {
        let defaults = UserDefaults.standard                    // 유저 디폴트 참조
        mySwitch2.isOn = defaults.bool(forKey: "switchOn")      // Bool 형의 값을 읽는다
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
