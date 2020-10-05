//
//  1ViewController.swift
//  View and Image
//
//  Created by Dongha Kang on 2020/10/05.
//

import UIKit

class FirstViewController: UIViewController {
    
    static let identifier: String = "View1"

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSecondView()
        setupLabel()
    }
    
    func setupLabel() {
        let labelA = UILabel()
        labelA.text = "Label A"
        labelA.frame = CGRect(x: 80, y: 150, width: 110, height: 21)
        labelA.backgroundColor = .orange
        labelA.textColor = .white
        
        self.view.addSubview(labelA)            // 라벨을 만든뒤, 루트 뷰에 추가한다.
    }

    
    func setupSecondView() {
        let theView = UIView()
        theView.frame = CGRect(x: 60, y: 300, width: 210, height: 200)
        theView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.6, alpha: 1)
        
        let labelB = UILabel()
        labelB.text = "Label B"
        labelB.frame = CGRect(x: 50, y: 60, width: 110, height: 21)
        labelB.backgroundColor = .orange
        labelB.textColor = .white
        
        theView.addSubview(labelB)
        self.view.addSubview(theView)
    }
}
