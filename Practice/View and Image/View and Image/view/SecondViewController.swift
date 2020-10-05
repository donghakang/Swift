//
//  SecondViewController.swift
//  View and Image
//
//  Created by Dongha Kang on 2020/10/05.
//

import UIKit

class SecondViewController: UIViewController {

    static let identifier = "View2"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .orange
        
        setupImageView()
    }
    
    func setupImageView() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        imageView.contentMode = .scaleAspectFit
        imageView.center = self.view.center
//        imageView.contentMode = .center
//        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "temp")
        self.view.addSubview(imageView)
    }
}
