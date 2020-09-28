//
//  File.swift
//  Scret
//
//  Created by Dongha Kang on 2020/09/28.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class Gesture {
    
    // MARK: Gesture Recognition
    func addGesture() {
        let backSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler(sender:)))
        backSwipeGesture.direction = .right
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler(sender:)))
        downSwipeGesture.direction = .down
        self.view.addGestureRecognizer(backSwipeGesture)
        self.view.addGestureRecognizer(downSwipeGesture)
        
    }
    
    @objc func swipeHandler(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            if sender.direction == .right {
                _ = navigationController?.popViewController(animated: true)
            }
        }
    }
}
