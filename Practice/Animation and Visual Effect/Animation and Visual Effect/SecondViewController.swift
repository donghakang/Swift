//
//  SecondViewController.swift
//  Animation and Visual Effect
//
//  Created by Dongha Kang on 2020/10/11.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var trash: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGesture()
        // Do any additional setup after loading the view.
    }
}


extension SecondViewController {
    func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapView(sender:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapView(sender: UITapGestureRecognizer) {
        // 탭한 좌표를 검색
        let tapPoint = sender.location(in: view)
        
        // 지정한 최종값이 될때 까지 애니메이션 적용
        UIView.animate(
            withDuration: 1.0,
            delay: 0,
            options: [.curveEaseInOut, .autoreverse, .repeat],
//            options: .curveEaseInOut,
            animations: {
//                self.trash.center = tapPoint
                self.trash.center.x = self.view.frame.width - 50
            },
            completion: nil)
    }
}
