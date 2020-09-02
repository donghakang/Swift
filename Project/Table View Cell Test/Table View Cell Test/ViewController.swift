//
//  ViewController.swift
//  Table View Cell Test
//
//  Created by Dongha Kang on 2020/09/02.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
        
//        if let label = cell.viewWithTag(1) as? UILabel {
//            label.text = "강동하"
//        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        
        cell.myLabel.text = "안녕하시오"
        return cell
    }
}

