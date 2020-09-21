//
//  MainViewController.swift
//  Scret
//
//  Created by Dongha Kang on 2020/09/19.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setButtonView()
    }
    

    // MARK: Visualization
    func setButtonView() {
        btn1.backgroundColor = .red
        btn2.backgroundColor = .green
        btn3.backgroundColor = .blue
        
        btn1.layer.cornerRadius = btn1.bounds.size.width / 2
        btn2.layer.cornerRadius = btn2.bounds.size.width / 2
        btn3.layer.cornerRadius = btn3.bounds.size.width / 2
    }
    
    func setView() {
        self.navigationController?.isNavigationBarHidden = true
    }
    

}
