//
//  LetterView.swift
//  Scret
//
//  Created by Dongha Kang on 2020/09/27.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class LetterView: UICollectionReusableView {
    
    static let identifier = "LetterView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "header"
        label.textAlignment = .center
        
        return label
    }()
    
    public func configure() {
        backgroundColor = .systemPink
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
}