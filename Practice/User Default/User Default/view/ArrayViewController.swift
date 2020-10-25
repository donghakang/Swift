//
//  ArrayViewController.swift
//  User Default
//
//  Created by Dongha Kang on 2020/10/25.
//

import UIKit

class ArrayViewController: UIViewController {

    @IBAction func getList(_ sender: Any) {
        let defaults = UserDefaults.standard
        if let theList = defaults.array(forKey: "myList") {
            print(theList)
        }
    }
    
    func saveStatus() {
        let list = [1,2,3]
        
        let defaults = UserDefaults.standard
        defaults.set(list, forKey: "myList")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveStatus()
    }
    
    
}
