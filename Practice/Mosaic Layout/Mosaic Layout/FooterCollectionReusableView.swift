//
//  FooterCollectionReusableView.swift
//  Mosaic Layout
//
//  Created by Dongha Kang on 2020/09/28.
//

import UIKit

class FooterCollectionReusableView: UICollectionReusableView {
    static let identifier = "FooterCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "footer"
        label.textAlignment = .center
        return label
    }()
    
    public func configure() {
        backgroundColor = .green
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
