//
//  FirstViewController.swift
//  Animation and Visual Effect
//
//  Created by Dongha Kang on 2020/10/11.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var car: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 타이머를 만든다
        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.step), userInfo: nil, repeats: true)
    }
        
    @objc func step() {
        // 수평 방향으로 이동
        car.center.x += 1
    
        // 오른쪽 가장자리에서 밖으로 나가면,
        let carWidth = car.bounds.width
        if car.center.x > (view.bounds.width + carWidth/2) {
            
            // 왼쪽끝의 바로 앞으로 되돌아간다.
            car.center.x = -carWidth
            
            // Y 좌표는 랜덤 높이로 변경한다.
            let viewH = view.bounds.height
            car.center.y = CGFloat(arc4random_uniform(UInt32(viewH)))
        }
    }
}
