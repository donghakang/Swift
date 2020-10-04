
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
            title.text = data.title
            bg.addSubview(title)

            // Letter Text View
            letter.text = data.letter
            bg.addSubview(letter)
            
            
            NSLayoutConstraint.activate([
                letter.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -120),
                letter.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
                letter.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
                title.bottomAnchor.constraint(equalTo: letter.topAnchor, constant: -20),
                title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
            ])

            
            
        }
    }
    
    
    fileprivate var title: UILabel = {
        let title = UILabel()
        title.text = "HELLO"
        title.textAlignment = .center
        title.textColor = .white
        title.font = UIFont(name: "Jalnan", size: 60)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    fileprivate var letter: UILabel = {
        let letter = UILabel()
        letter.font = UIFont(name: "Jalnan", size: 20)
        letter.translatesAutoresizingMaskIntoConstraints = false
        letter.sizeToFit()
        letter.numberOfLines = 0
        letter.textColor = .white
        return letter
    }()
    
    fileprivate var bg: UIView = UIView()

    
    
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

