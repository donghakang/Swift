//
//  ShapeFillViewController.swift
//  Core Graphic
//
//  Created by Dongha Kang on 2020/10/24.
//

import UIKit

class ShapeFillViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let drawImage = drawPathImage()
        let drawView = UIImageView(image: drawImage)
        
        view.addSubview(drawView)
    }
    
    func drawPathImage() -> UIImage {
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        UIColor.lightGray.setFill()
        
        // 사각형 패스
        let boxRect = CGRect(x: 100, y: 100, width: 150, height: 100)
        let boxPath = UIBezierPath(rect: boxRect)
        boxPath.lineWidth = 1.5
        boxPath.fill()
        boxPath.stroke()
        
        // 곡선 패스 (닫힌도형)
        let curvePath = UIBezierPath()
        let pt0 = CGPoint(x: 80, y: 300)
        let pt1 = CGPoint(x: 300, y: 500)
        let cPt1 = CGPoint(x: 400, y: 300)
        let cPt2 = CGPoint(x: 100, y: 500)
        curvePath.move(to: pt0)
        curvePath.addCurve(to: pt1, controlPoint1: cPt1, controlPoint2: cPt2)
        curvePath.lineWidth = 2
        curvePath.fill()            // - 칠한다
        curvePath.stroke()
        
        
        // 도형들
        let boxRect2 = CGRect(x: 80, y: 600, width: 150, height: 150)
        let boxPath2 = UIBezierPath(rect: boxRect2)
        
        let ovalRect1 = CGRect(x: 50, y: 550, width: 150, height: 150)
        let ovalPath1 = UIBezierPath(ovalIn: ovalRect1)
        let ovalRect2 = CGRect(x: 120, y: 650, width: 150, height: 150)
        let ovalPath2 = UIBezierPath(ovalIn: ovalRect2)
        
        
        let drawPath = UIBezierPath()
        drawPath.append(boxPath2)
        drawPath.append(ovalPath1)
        drawPath.append(ovalPath2)
        
        UIColor.red.setFill()
        drawPath.usesEvenOddFillRule = true
        drawPath.fill()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }

    
}
