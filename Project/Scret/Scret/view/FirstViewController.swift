//
//  FirstViewController.swift
//  Scret
//
//  Created by Dongha Kang on 2020/09/19.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIGestureRecognizerDelegate {
    /*
     미네소타 삶을 위한 폴더
     */
    
    
    let scrollView = UIScrollView()
    var imageViews = [UIImageView]()
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HELLOs")
        
        
        self.view.addSubview(scrollView)
        
        let im1 = UIImageView()
        let im2 = UIImageView()
        let im3 = UIImageView()
        let im4 = UIImageView()
        let im5 = UIImageView()
        let im6 = UIImageView()
        
        
        
        imageViews = [im1, im2, im3, im4, im5, im6]
        
        
        for im in imageViews {
            scrollView.addSubview(im)
            im.image = UIImage(named:"img2")
        }
        
        scrollViewLayout()
        setLayout()
        
        
        // Gesture
        let backSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler(sender:)))
        backSwipeGesture.direction = .right
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler(sender:)))
        downSwipeGesture.direction = .down
        self.view.addGestureRecognizer(backSwipeGesture)
        self.view.addGestureRecognizer(downSwipeGesture)
        
    }
  
    // MARK: Gesture Recognition
    @objc func swipeHandler(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            if sender.direction == .right {
                _ = navigationController?.popViewController(animated: true)
            }
        }
    }
    
    
    func scrollViewLayout() {
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
        
        // 스크롤 뷰는 항상 우리가 보는 메인과 동등한 사이즈를 (혹은 스크린에 알맞는 사이즈)를 가지고 있다.
        self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true;
        self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true;
        self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true;
        self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true;
    }
    
    
    
    func setLayout() {
        // 코드로 constraint 설정할때 무조건 넣는다.
        
        for i in 0...imageViews.count-1 {
            imageViews[i].translatesAutoresizingMaskIntoConstraints = false
            imageViews[i].centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            imageViews[i].heightAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true // Y 사이즈
            imageViews[i].widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true  // X 사이즈
            if i == 0 {
                // 첫번째 사진은 스크롤 뷰 제일 위에 위치한다
                imageViews[i].topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
            } else {
                // 그 외는 사진 밑에 붙인다
                imageViews[i].topAnchor.constraint(equalTo: imageViews[i-1].bottomAnchor).isActive = true
                if i == imageViews.count - 1 {
                    // 맨 마지막 사진은 바닥도 맞춘다.
                    imageViews[i].bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
                }
            }
        }
        
        let tmp = imageViews[imageViews.count - 1]
        tmp.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true      // scroll view active
                
        /* OTHER WAY TO DO SUCH WORK
         let constraints2 = [
             bgImage2.centerXAnchor.constraint(equalTo:view.centerXAnchor),
             bgImage2.heightAnchor.constraint(equalToConstant: self.view.frame.width),
             bgImage2.widthAnchor.constraint(equalToConstant: self.view.frame.width),
             bgImage2.topAnchor.constraint(equalTo: bgImage1.bottomAnchor)]
         NSLayoutConstraint.activate(constraints2)
         */

      
        
    }

}
