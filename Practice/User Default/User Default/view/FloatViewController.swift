//
//  FloatViewController.swift
//  User Default
//
//  Created by Dongha Kang on 2020/10/25.
//

import UIKit

class FloatViewController: UIViewController {
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var sliderLabel1: UILabel!

    @IBOutlet weak var progress2: UIProgressView!
    @IBOutlet weak var sliderLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func saveStatus(_ sender: Any) {
        let defaults = UserDefaults.standard            // User Default
        let value = slider1.value
        sliderLabel1.text = String(value)
        defaults.set(value, forKey: "sliderValue")      // slider1의 float 형 값을 'sliderValue'라는 키로 저장
    }
    @IBAction func readStatus(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        let value = defaults.float(forKey: "sliderValue") // "sliderValue"키를 찾아 지정한다.
        sliderLabel2.text = String(value)
        progress2.progress = value
    }
    
}
