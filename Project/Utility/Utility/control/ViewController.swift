//
//  ViewController.swift
//  Utility
//
//  Created by Dongha Kang on 2020/09/13.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableArr:[String] = ["Stepper and Switch", "Segment Control", "TextField"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
        
        cell.textLabel?.text = tableArr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = storyboard?.instantiateViewController(identifier: "StepperVC") as? StepperViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        case 1:
            let vc = storyboard?.instantiateViewController(identifier: "SegmentControlVC") as? SegmentControlViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        case 2:
            let vc = storyboard?.instantiateViewController(identifier: "TextFieldVC") as? TextFieldViewController
            self.navigationController?.pushViewController(vc!, animated: true)
            
//            let vc = storyboard?.instantiateViewController(identifier: "CameraViewController") as? CameraViewController
//            self.navigationController?.pushViewController(vc!, animated: true)
        default:
            break
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

