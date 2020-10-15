//
//  GraphViewController.swift
//  Core Graphic
//
//  Created by Dongha Kang on 2020/10/15.
//

import UIKit

class GraphViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let drawImage = drawLine()
        let drawView = UIImageView(image: drawImage)
        
        self.view.addSubview(drawView)
    }
    

    func arcPercent(_ radius: CGFloat, _ percent: Double) -> UIBezierPath {
        let endAngle = 2 * -M_PI*percent/100 - M_PI_2
        let path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0),
                                radius: radius,
                                startAngle: CGFloat(-M_PI_2),
                                endAngle: CGFloat(endAngle),
                                clockwise: percent > 0)
        
        return path
    }

    
    func drawLine() -> UIImage {
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        let percent = 58.2
        
        // 원호 패스를 만든다
        UIColor.red.setStroke()
        let arcPath = arcPercent(80, percent)
        arcPath.lineWidth = 60
        arcPath.lineCapStyle = .round
        
        // 패스를 평행이동
        let tf = CGAffineTransform(translationX: view.center.x, y: view.center.y)
        arcPath.apply(tf)
        
        arcPath.stroke()
        
        // 숫자 쓰기
        let font = UIFont.boldSystemFont(ofSize: 28)
        let textFontAttributes = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: UIColor.gray]
        let drawString = String(percent) + "%"
        let posX = view.center.x - 45
        let posY = view.center.y - 15
        
        let rect = CGRect(x: posX, y: posY, width: 90, height: 30)
        drawString.draw(in: rect, withAttributes: textFontAttributes)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
}
