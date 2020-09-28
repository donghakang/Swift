//
//  MyCollectionViewCell.swift
//  Scret
//
//  Created by Dongha Kang on 2020/09/28.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .red
    }


}
