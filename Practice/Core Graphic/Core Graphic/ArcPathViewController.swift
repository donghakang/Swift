//
//  ArcPathViewController.swift
//  Core Graphic
//
//  Created by Dongha Kang on 2020/10/15.
//

import UIKit

class ArcPathViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let drawImage = drawLine()
        let drawView = UIImageView(image: drawImage)
        
        self.view.addSubview(drawView)

    }
    
    
    func drawLine() -> UIImage {
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        // 원호 패스를 만든다
        let center = CGPoint(x: view.center.x, y: view.center.y)
        let arcPath = UIBezierPath(arcCenter: center,
                                   radius: 80,
                                   startAngle: CGFloat(-M_PI_2),
                                   endAngle: CGFloat(M_PI_4*3),
                                   clockwise: true)
        
        // 중심까지 직선 패스 추가
        arcPath.addLine(to: center)
        // 패스를 닫는다
        arcPath.close()
        
        
        // 패스 칠하기
        UIColor.cyan.setFill()
        arcPath.fill()
        
        // 패스 그리기
        arcPath.lineWidth = 5
        arcPath.lineCapStyle = .butt
        arcPath.stroke()
        
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    

}
