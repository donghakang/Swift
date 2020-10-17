//
//  MovingArcViewController.swift
//  Core Graphic
//
//  Created by Dongha Kang on 2020/10/17.
//

import UIKit

class MovingArcViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    var drawImage = UIImage()
    var drawView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        drawImage = drawLine(progress: Double(slider.value), max: 100.0)
        drawView = UIImageView(image: drawImage)
        
        self.view.addSubview(drawView)
    }
    
    @IBAction func sliderMove(_ sender: UISlider) {
        drawImage = drawLine(progress: Double(slider.value), max: 100)
        drawView.image = drawImage
    }
    
    func arcPercent(radius: CGFloat, progress: Double, max: Double) -> UIBezierPath {
        let endAngle = 2 * .pi * progress/max - (.pi / 2)
        let path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0),
                                radius: radius,
                                startAngle: CGFloat(-Double.pi / 2.0),
                                endAngle: CGFloat(endAngle),
                                clockwise: true)
        
        return path
    }

    
    func drawLine(progress: Double, max: Double) -> UIImage {
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        // 원호 패스를 만든다
        UIColor.red.setStroke()
        let arcPath = arcPercent(radius: 100, progress: progress, max: max)
        arcPath.lineWidth = 60
        arcPath.lineCapStyle = .round
        
        // 패스를 평행이동
        let tf = CGAffineTransform(translationX: view.center.x, y: view.center.y)
        arcPath.apply(tf)
        
        arcPath.stroke()
        
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}
