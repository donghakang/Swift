//
//  ViewController.swift
//  DrawerLayout
//
//  Created by Dongha Kang on 2020/10/14.
//

import UIKit

class ViewController: UIViewController {
    
    let sideMenu = SideMenuView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        
        sideMenu.addMenuTo(sender: self)
        
        
        addGesture()
        
        self.view.addSubview(sideMenu)
        
        // Do any additional setup after loading the view.
    }


}

extension ViewController {
    func addGesture() {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler(sender:)))
        swipeGesture.direction = .right
        self.view.addGestureRecognizer(swipeGesture)
    }
        
    @objc func swipeHandler(sender: UISwipeGestureRecognizer) {
        sideMenu.appear(sender: self)
    }
}
