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
    
    /**
     captureSession help us to transfer data between one or more data like camera or microphone
     videoPreviewLayer helps to render the camera view finder in our ViewController
     */
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
