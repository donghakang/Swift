//
//  MovingArcTimerViewController.swift
//  Core Graphic
//
//  Created by Dongha Kang on 2020/10/17.
//

import UIKit



class MovingArcTimerViewController: UIViewController {

    var drawImage = UIImage()
    var drawView = UIImageView()
    
    var drawImage2 = UIImage()
    var drawView2 = UIImageView()
    
    var drawImage3 = UIImage()
    var drawView3 = UIImageView()
    
    var drawImage4 = UIImage()
    var drawView4 = UIImageView()
    
    var timer = Timer();
    
    var time = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        drawImage = drawLine()
        drawView = UIImageView(image: drawImage)
        
        drawImage2 = drawLine()
        drawView2 = UIImageView(image: drawImage2)
            
        drawImage3 = drawLine()
        drawView3 = UIImageView(image: drawImage3)
        
        drawImage4 = drawLine()
        drawView4 = UIImageView(image: drawImage4)
            
        self.view.addSubview(drawView)              // 1초 마다
        self.view.addSubview(drawView2)             // 2초 마다
        self.view.addSubview(drawView3)             // 5초 마다
        self.view.addSubview(drawView4)             // 10초 마다
        // 0.01초에 한번씩
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
    }
    
    
    
    @objc func runTimer() {
        time += 1.0
        time = time.truncatingRemainder(dividingBy: 100000) == 0 ? 0 : time
        let newTime = easeInOutQuart(progress: time.truncatingRemainder(dividingBy: 100), max: 100)
        drawImage = drawLine(color: UIColor(red: 8/255, green: 95/255, blue: 99/255, alpha: 1),
                             radius:170,
                             lineWidth: 10,
                             progress: newTime)
        drawView.image = drawImage
        
        let newTime2 = easeInOutQuart(progress: time.truncatingRemainder(dividingBy: 200), max: 200)
        drawImage2 = drawLine(color: UIColor(red: 79/255, green: 190/255, blue: 183/255, alpha: 1),
                              radius: 155,
                              lineWidth: 20,
                              progress: newTime2)
        drawView2.image = drawImage2
        
        let newTime3 = easeInOutQuart(progress: time.truncatingRemainder(dividingBy: 500), max: 500)
        drawImage3 = drawLine(color: UIColor(red: 250/255, green: 207/255, blue: 90/255, alpha: 1),
                              radius: 125,
                              lineWidth: 40,
                              progress: newTime3)
        drawView3.image = drawImage3
        
        let newTime4 = easeInOutQuart(progress: time.truncatingRemainder(dividingBy: 1000), max: 1000)
        drawImage4 = drawLine(color: UIColor(red: 1, green: 89/255, blue: 89/255, alpha: 1),
                              radius: 80,
                              lineWidth: 50,
                              progress: newTime4)
        drawView4.image = drawImage4
        
    }
    
    
    func easeInOutQuart(progress: Double, max: Double) -> Double {
        let x = progress / max
        return x < 0.5 ? 4 * x * x * x : 1 - pow(-2 * x + 2, 3) / 2
    }
}


extension MovingArcTimerViewController {
    func arcPercent(radius: CGFloat, progress: Double) -> UIBezierPath {
        let endAngle = (2 * .pi) * progress - (Double.pi / 2)
        let path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0),
                                radius: radius,
                                startAngle: CGFloat(-Double.pi / 2.0),
                                endAngle: CGFloat(endAngle),
                                clockwise: true)
        
        return path
    }

    func drawLine() -> UIImage {
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        // 원호 패스를 만든다
        UIColor.red.setStroke()
        
        let arcPath = arcPercent(radius: 100, progress: 0)
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
    
    
    func drawLine(color: UIColor, radius: CGFloat, lineWidth: CGFloat, progress: Double) -> UIImage {
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        // 원호 패스를 만든다
        color.setStroke()
        
        let arcPath = arcPercent(radius: radius, progress: progress)
        arcPath.lineWidth = lineWidth
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

