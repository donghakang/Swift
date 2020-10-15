//
//  ArcViewController.swift
//  Core Graphic
//
//  Created by Dongha Kang on 2020/10/14.
//

import UIKit

class ArcViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let drawImage1 = drawLine(x: self.view.center.x, y: self.view.center.y, lineCapStyle: .round)
        let drawView1 = UIImageView(image: drawImage1)
        view.addSubview(drawView1)
       
        let drawImage2 = drawLine(x: self.view.center.x, y: 200, lineCapStyle: .butt)
        let drawView2 = UIImageView(image: drawImage2)
        view.addSubview(drawView2)
       
        let drawImage3 = drawLine(x: self.view.center.x, y: self.view.frame.height - 200, lineCapStyle: .square)
        let drawView3 = UIImageView(image: drawImage3)
        view.addSubview(drawView3)
    }
    
    func drawLine(x: CGFloat, y: CGFloat, lineCapStyle: CGLineCap) -> UIImage {
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        // 원호 패스를 만든다
        let arcPath = UIBezierPath(arcCenter: CGPoint(x: x, y: y),
                                   radius: 80.0,
                                   startAngle: 0.0,
                                   endAngle: CGFloat(M_PI*5/3),
                                   clockwise: true)
        arcPath.lineWidth = 40
        arcPath.lineCapStyle = lineCapStyle
        arcPath.stroke()
        
        
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    
        return image!
    }
}
