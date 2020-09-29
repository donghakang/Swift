
//  LetterCollectionViewCell.swift
//  0930
//
//  Created by Dongha Kang on 2020/09/28.
//

import UIKit

class LetterCollectionViewCell: UICollectionViewCell {

    static let identifier = "LetterCollectionViewCell"
    
    
    var data: LetterData? {
        didSet {
            guard let data = data else { return }
            
            // background image
            bg = setGradientBackground(start: data.startColor, end: data.endColor)
            addSubview(bg)
            bg.topAnchor.constraint(equalTo: topAnchor).isActive = true
            bg.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            bg.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
            bg.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            bg.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            bg.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            
            
            // Title Label
            bg.addSubview(title)
            title.text = data.title
            title.textAlignment = .center
            title.textColor = .white
            title.font = title.font.withSize(60)
            
            title.translatesAutoresizingMaskIntoConstraints = false;
            NSLayoutConstraint.activate([
                title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
                title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
            ])
            
            // Letter Text View

            
            
        }
    }
    
    
    fileprivate var title: UILabel = UILabel()
    
    fileprivate var bg: UIView = UIView()

    fileprivate let tv: UITextView = {
        let tv = UITextView()
        tv.text = "Thread 1: Fatal error: Unexpectedly found nil while unwrapping an Optional value"
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.clipsToBounds = true
        tv.textColor = .black
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
}


extension LetterCollectionViewCell {
    func setGradientBackground(start: UIColor, end: UIColor) -> UIView{
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: self.contentView.frame.height))
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [start.cgColor, end.cgColor]

        view.layer.insertSublayer(gradient, at: 0)
        
        return view
    }

}

