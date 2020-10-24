//
//  LineViewController.swift
//  Core Graphic
//
//  Created by Dongha Kang on 2020/10/24.
//

import UIKit

class LineViewController: UIViewController {

    func drawLine() -> UIImage {
        // 꺽은 선을 그릴 점의 배열
        var pointList = Array<CGPoint>()
        let pointCount = 20                 // 점의 갯수
        
        let dx = Int(view.frame.width)/pointCount       // x 의 간격
        let height = UInt32(view.frame.height)/2        // y 의 간격
        
        // point in pointList
        for n in 1...pointCount {
            let px = CGFloat(dx * n)
            let py = CGFloat(arc4random_uniform(height) + 50)
            let point = CGPoint(x: px, y: py)
            pointList.append(point)
        }
        
        // 이미지 처리
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        // 패스 초기화
        let drawPath = UIBezierPath()
        
        //시작점으로 이동
        drawPath.move(to: pointList[0])
        pointList.removeFirst()                 // 배열에서 시작점을 없앤다
        for pt in pointList {
            drawPath.addLine(to: pt)
        }
        
        // 선 특징
        UIColor.blue.setStroke()
        drawPath.lineWidth = 2.0
        drawPath.lineJoinStyle = .round
        drawPath.setLineDash([4.0, 2.0], count: 2, phase: 0.0)      // 점선
        drawPath.stroke()
        
        // 이미지 처리 종료
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let drawImage = drawLine()
        let drawView = UIImageView(image: drawImage)
        
        view.addSubview(drawView)
    }
}
