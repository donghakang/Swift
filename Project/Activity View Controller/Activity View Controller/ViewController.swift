//
//  ViewController.swift
//  Activity View Controller
//
//  Created by Dongha Kang on 2020/08/31.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapShareBtn(_ sender: Any) {
        let shareText = "글을 써봐요"
        let shareItems = [shareText]
        let exclusion = [UIActivity.ActivityType.copyToPasteboard,
                         UIActivity.ActivityType.addToReadingList]
        
        let avc = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        avc.excludedActivityTypes = exclusion
        
        present(avc, animated: true, completion: nil)
    }
    
}

