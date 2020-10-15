//
//  RoundBoxViewController.swift
//  Core Graphic
//
//  Created by Dongha Kang on 2020/10/14.
//

import UIKit

class RoundBoxViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let boxImage = makeRoundBoxImage(width: 240, height: 180, corner: 20)
        let boxView = UIImageView(image: boxImage)
        boxView.center = view.center
        view.addSubview(boxView)
    }

    func makeRoundBoxImage(width w: CGFloat, height h: CGFloat, corner r: CGFloat) -> UIImage {
        let size = CGSize(width: w, height: h)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        let context = UIGraphicsGetCurrentContext()
        
        let drawRect = CGRect(x: 0, y: 0, width: w, height: h)
        let drawPath = UIBezierPath(roundedRect: drawRect, cornerRadius: r)
        
        context?.setFillColor(red: 0, green: 1, blue: 1, alpha: 1)
        drawPath.fill()
        
        context?.setStrokeColor(red: 0, green: 0, blue: 1, alpha: 1)
        drawPath.stroke()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }

}
