//
//  DetailViewController.swift
//  Image Selection
//
//  Created by Dongha Kang on 2020/09/03.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            self.title = "\(detail)"
            if let imageView = self.photoImageView {
                let fileName = "\(detail).png"
                imageView.image = UIImage(named: fileName)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

