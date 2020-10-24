//
//  BezierViewController.swift
//  Core Graphic
//
//  Created by Dongha Kang on 2020/10/24.
//

import UIKit

class BezierViewController: UIViewController {

    func drawLine() -> UIImage {
        let a = CGPoint(x: 50, y: 170)
        let b = CGPoint(x: 250, y: 200)
        let c = CGPoint(x: 120, y: 300)
        
        let d = CGPoint(x: 50, y: 400)
        let e = CGPoint(x: 250, y: 400)
        let f = CGPoint(x: 250, y: 600)
        let g = CGPoint(x: 100, y: 750)
        
        // 이미지 처리
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        // - 보조선
        let linePath = UIBezierPath()
        
        linePath.append(makeLinePath(startPoint: a, endPoint: b))
        linePath.append(makeLinePath(startPoint: b, endPoint: c))
        
        linePath.append(makeLinePath(startPoint: d, endPoint: e))
        linePath.append(makeLinePath(startPoint: e, endPoint: f))
        linePath.append(makeLinePath(startPoint: f, endPoint: g))
        
        // 선모양
        UIColor.black.setStroke()
        linePath.setLineDash([2.0, 2.0], count: 2, phase: 0.0)
        linePath.stroke()
        
        
        // - 베지에 곡선 1
        UIColor.red.setStroke()
        let curvePath1 = UIBezierPath()
        curvePath1.move(to: a)
        curvePath1.addQuadCurve(to: c, controlPoint: b)
        curvePath1.lineWidth = 2
        curvePath1.stroke()
        
        // - 베지에 곡선 2
        UIColor.red.setStroke()
        let curvePath2 = UIBezierPath()
        curvePath2.move(to: d)
        curvePath2.addCurve(to: g, controlPoint1: e, controlPoint2: f)
        curvePath2.lineWidth = 2
        curvePath2.stroke()
        
        // 이미지
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndPDFContext()
        return image!
    
        
    }
    
    
    // 곡선의 패스를 만드는 함수 -- > 보조선 패스
    func makeLinePath(startPoint: CGPoint, endPoint: CGPoint) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        
        return path
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let drawImage = drawLine()
        let drawView = UIImageView(image: drawImage)
        
        view.addSubview(drawView)
    }
    
}
