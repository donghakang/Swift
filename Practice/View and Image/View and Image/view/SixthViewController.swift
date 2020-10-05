//
//  SixthViewController.swift
//  View and Image
//
//  Created by Dongha Kang on 2020/10/05.
//
//  Adding Stack View Programmatically

import UIKit

class SixthViewController: UIViewController {
    static let identifier = "View6"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 스택 뷰에 넣을 뷰를 준비
        let view1 = UIView()
        let view2 = UIView()
        view1.backgroundColor = .lightGray
        view2.backgroundColor = .gray
        
        // 사진 Image view
        let photo1 = UIImageView(image: UIImage(named: "temp"))
        let photo2 = UIImageView(image: UIImage(named: "temp"))
        let photo3 = UIImageView(image: UIImage(named: "temp"))
        
        photo1.contentMode = .scaleAspectFill
        photo1.clipsToBounds = true
        photo2.contentMode = .scaleAspectFill
        photo2.clipsToBounds = true
        photo3.contentMode = .scaleAspectFill
        photo3.clipsToBounds = true
        
        
        // 스택 뷰를 만든다
        let rect = CGRect(x: 0, y: 0, width: 300, height: 600)
        let stackView = UIStackView(frame: rect)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        
        // 스택 뷰에 뷰를 추가한다.
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        stackView.addArrangedSubview(photo1)
        stackView.addArrangedSubview(photo2)
        stackView.addArrangedSubview(photo3)
        
        
        // 스택 뷰를 화면 중앙에 표시한다
        stackView.center = self.view.center
        self.view.addSubview(stackView)
    }

}
