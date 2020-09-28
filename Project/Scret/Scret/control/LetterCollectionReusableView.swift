//
//  LetterCollectionReusableView.swift
//  Scret
//
//  Created by Dongha Kang on 2020/09/28.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class LetterCollectionReusableView: UICollectionReusableView {
    static let identifier = "LetterCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "header"
        label.textAlignment = .center
        
        return label
    }()
    
    public func configure() {
        backgroundColor = .red
        addSubview(label)
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
