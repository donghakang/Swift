//
//  FirstViewController.swift
//  Scret
//
//  Created by Dongha Kang on 2020/09/19.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    /*
     미네소타 삶을 위한 폴더
     */
    
    
    let scrollView = UIScrollView()

    let bgImage1 = UIImageView()
    let bgImage2 = UIImageView()
    let bgImage3 = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(scrollView)
        
        scrollView.addSubview(bgImage1)
        scrollView.addSubview(bgImage2)
        scrollView.addSubview(bgImage3)
        bgImage1.image = UIImage(named: "launch_img")
        bgImage2.image = UIImage(named: "img2")
        bgImage3.image = UIImage(named: "img2")
        setLayout()
        
    }
    
    
    func setLayout() {
        // 코드로 constraint 설정할때 무조건 넣는다.
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
        bgImage1.translatesAutoresizingMaskIntoConstraints = false
        bgImage2.translatesAutoresizingMaskIntoConstraints = false
        bgImage3.translatesAutoresizingMaskIntoConstraints = false
        
        
        // 스크롤 뷰는 항상 우리가 보는 메인과 동등한 사이즈를 (혹은 스크린에 알맞는 사이즈)를 가지고 있다.
        self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true;
        self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true;
        self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true;
        self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true;
        
        
        
        bgImage1.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true // horizontal alignment
        bgImage1.heightAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true // Y 사이즈
        bgImage1.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true  // X 사이즈
        bgImage1.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        
        let constraints2 = [
            bgImage2.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            bgImage2.heightAnchor.constraint(equalToConstant: self.view.frame.width),
            bgImage2.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            bgImage2.topAnchor.constraint(equalTo: bgImage1.bottomAnchor)]
        
        NSLayoutConstraint.activate(constraints2)
        
        let constraints3 = [
            bgImage3.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            bgImage3.heightAnchor.constraint(equalToConstant: self.view.frame.width),
            bgImage3.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            bgImage3.topAnchor.constraint(equalTo: bgImage2.bottomAnchor),
            bgImage3.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)    // 제일 마지막 사진과, 스크롤 뷰의 마지막과는 같은 위치에 layout이 설정 된다.
        ]
        
        NSLayoutConstraint.activate(constraints3)
        
        
      
        
    }

}
