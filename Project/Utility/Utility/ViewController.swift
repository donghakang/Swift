//
//  ViewController.swift
//  Utility
//
//  Created by Dongha Kang on 2020/09/13.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableArr:[String] = ["A", "B", "C", "D", "E"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
        
        cell.textLabel?.text = tableArr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0) {
            let vc = storyboard?.instantiateViewController(identifier: "CameraViewController") as? CameraViewController
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

