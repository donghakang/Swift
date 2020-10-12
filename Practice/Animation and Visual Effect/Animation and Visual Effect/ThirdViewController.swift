//
//  ThirdViewController.swift
//  Animation and Visual Effect
//
//  Created by Dongha Kang on 2020/10/11.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addGesture()
    }
    
    
    func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapView(sender:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapView(sender: UITapGestureRecognizer) {
        let flame = UIImageView(image: UIImage(systemName: "flame.fill"))
        flame.alpha = 0
        
        let scaleTransform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        let rotationTransfrom = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
        let transform = scaleTransform.concatenating(rotationTransfrom)
        flame.transform = transform
        
        flame.center = sender.location(in: self.view)
        view.addSubview(flame)
        
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
            flame.alpha = 1.0
            flame.transform = .identity
        }, completion: nil)
    }
}
