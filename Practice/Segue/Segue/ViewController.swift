//
//  ViewController.swift
//  Segue
//
//  Created by Dongha Kang on 2020/10/09.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func comeHome (_ sender: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func toNextVC(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(identifier: "nextPage")
        nextVC?.modalTransitionStyle = .
        present(nextVC!, animated: true, completion: nil);
    }
}

