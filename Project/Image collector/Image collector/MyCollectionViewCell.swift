//
//  MyCollectionViewCell.swift
//  Image collector
//
//  Created by Dongha Kang on 2020/09/28.
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
