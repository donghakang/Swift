//
//  StepperViewController.swift
//  Utility
//
//  Created by Dongha Kang on 2020/09/15.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class StepperViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changedStepperValue(_ sender: UIStepper) {
        let num = Int(sender.value)
        numberLabel.text = String(num)
    }
    
    @IBAction func showHide(_ sender: Any) {
        numberLabel.isHidden = !(sender as AnyObject).isOn
        
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
