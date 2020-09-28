//
//  ViewController.swift
//  0930
//
//  Created by Dongha Kang on 2020/09/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }


    
    func setView() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
}

