//
//  SegmentControlViewController.swift
//  Utility
//
//  Created by Dongha Kang on 2020/09/16.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class SegmentControlViewController: UIViewController {

    @IBOutlet weak var colorChip: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changedColor(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            colorChip.backgroundColor = .blue
        case 1:
            colorChip.backgroundColor = .yellow
        case 2:
            colorChip.backgroundColor = .green
        default:
            colorChip.backgroundColor = .blue
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
