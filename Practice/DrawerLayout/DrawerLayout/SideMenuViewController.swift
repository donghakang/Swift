//
//  SideMenuViewController.swift
//  DrawerLayout
//
//  Created by Dongha Kang on 2020/10/14.
//

import UIKit

class SideMenuViewController: UIViewController {

    static let identifier = "SideMenu"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.view.frame.width = self.view.frame.width * 3 / 4
    }
    
}
