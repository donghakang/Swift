//
//  ViewController.swift
//  Launch Screen Test
//
//  Created by Dongha Kang on 2020/09/07.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapBtn(_ sender: Any) {
        myLabel.text = NSLocalizedString("Hello", comment: "")
    }
    
}

