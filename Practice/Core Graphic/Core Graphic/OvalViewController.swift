//
//  OvalViewController.swift
//  Core Graphic
//
//  Created by Dongha Kang on 2020/10/14.
//

import UIKit

class OvalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let boxImage = makeOvalImage(width: 240, height: 180)
        let boxView = UIImageView(image: boxImage)
        boxView.center = view.center
        view.addSubview(boxView)
    }

    func makeOvalImage(width w: CGFloat, height h: CGFloat) -> UIImage {
        let size = CGSize(width: w, height: h)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        let context = UIGraphicsGetCurrentContext()
        
        let drawOval = CGRect(x: 0, y: 0, width: w, height: h)
        let drawPath = UIBezierPath(ovalIn: drawOval)
        
        context?.setFillColor(red: 0, green: 1, blue: 1, alpha: 1)
        drawPath.fill()
        
        context?.setStrokeColor(red: 0, green: 0, blue: 1, alpha: 1)
        drawPath.stroke()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }

}
