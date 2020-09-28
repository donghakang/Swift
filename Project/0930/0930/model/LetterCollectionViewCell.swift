
//  LetterCollectionViewCell.swift
//  0930
//
//  Created by Dongha Kang on 2020/09/28.
//

import UIKit

class LetterCollectionViewCell: UICollectionViewCell {

    static let identifier = "LetterCollectionViewCell"
    
    
//    let label = UILabel()


    fileprivate let bg: UITextView = {
        let tv = UITextView()
        tv.text = "Thread 1: Fatal error: Unexpectedly found nil while unwrapping an Optional value"
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.clipsToBounds = true
        tv.textColor = .black
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bg)
        bg.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bg.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bg.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
