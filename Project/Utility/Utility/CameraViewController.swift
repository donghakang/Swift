//
//  CameraViewController.swift
//  Utility
//
//  Created by Dongha Kang on 2020/09/13.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {

    @IBOutlet weak var cameraView: UIView!
    
    
    let captureSession = AVCaptureSession()
    var previewLayer:CALayer!
    var captureDevice:AVCaptureDevice!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
