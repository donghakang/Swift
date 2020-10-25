//
//  ViewController.swift
//  Custom Camera
//
//  Created by Dongha Kang on 2020/10/24.
//

import UIKit
import AVFoundation
import Photos

class ViewController: UIViewController, AVCapturePhotoCaptureDelegate {

    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var previewView: UIView!
    
    var session = AVCaptureSession()
    var photoOutput = AVCapturePhotoOutput()
    
    let notification = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        
        // 카메라 입출력 설정
        setupInputOutput()
        setPreviewLayer()
        
        // 세션 시작
        session.startRunning()
        
        
        notification.addObserver(self, selector: #selector(changedDeviceOrientation(_:)), name: UIDevice.orientationDidChangeNotification, object: nil)
    }

    @IBAction func takePhoto(_ sender: Any) {
        let captureSetting = AVCapturePhotoSettings()
        captureSetting.flashMode = .auto
        captureSetting.isAutoStillImageStabilizationEnabled = true
        captureSetting.isHighResolutionPhotoEnabled = false
        
        photoOutput.capturePhoto(with: captureSetting, delegate: self)
        
        switch UIDevice.current.orientation {
        case .portrait:
            print("normal")
            
        case .portraitUpsideDown:
            print("upside down")
            
        case .landscapeLeft:
            print("left")
            
        case .landscapeRight:
            print("right")
            
            
        default:
            break
        }
    }
    
    
    func setButton() {
        self.view.addSubview(cameraButton)

        // constraints
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        cameraButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        cameraButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive = true
        cameraButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        cameraButton.heightAnchor.constraint(equalToConstant: 60).isActive = true


        // visual
        cameraButton.setTitle("", for: .normal)
        cameraButton.tintColor = .green
        cameraButton.setBackgroundImage(UIImage(systemName: "camera.viewfinder"), for: .normal)
        cameraButton.imageView?.contentMode = .scaleAspectFit
    }
}

extension ViewController {
    // 입출력 설정
    func setupInputOutput() {
        session.sessionPreset = .photo      // 해상도
        
        // 입력 설정
        do {
            let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            
            let input = try AVCaptureDeviceInput(device: device!)
            if session.canAddInput(input) {
                session.addInput(input)
            } else {
                print("세션에 입력을 추기할 수 없습니다.")
                return
            }
        } catch let error as NSError {
            print("카메라가 없습니다. \(error)")
            return
        }
        
        // 출력 설정
        if session.canAddOutput(photoOutput) {
            session.addOutput(photoOutput)
        } else {
            print("세션을 출력을 추가할 수 없습니다.")
            return
        }
        
        
    }
    
    
    
    func setPreviewLayer() {
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        let videoLayer = previewLayer
        
        videoLayer.frame = view.bounds
        videoLayer.masksToBounds = true
        videoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        previewView.layer.addSublayer(videoLayer)
        
    }
}


extension ViewController {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?, previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        // buffer 에서 jpeg 를 꺼내온다
        
        let photoData = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: photoSampleBuffer!, previewPhotoSampleBuffer: previewPhotoSampleBuffer)
        
        if let data = photoData {
            if let stillImage = UIImage(data: data) {
                UIImageWriteToSavedPhotosAlbum(stillImage, self, nil, nil)
            }
        }
    }
}

extension ViewController {
    @objc func changedDeviceOrientation(_ notification: Notification) {
        if let photoOutputConnection = self.photoOutput.connection(with: AVMediaType.video) {
            switch UIDevice.current.orientation {
            case .portrait:
                print("normal")
                photoOutputConnection.videoOrientation = .portrait
            case .portraitUpsideDown:
                print("upside down")
                photoOutputConnection.videoOrientation = .portraitUpsideDown
            case .landscapeLeft:
                print("left")
                photoOutputConnection.videoOrientation = .landscapeRight
            case .landscapeRight:
                print("right")
                photoOutputConnection.videoOrientation = .landscapeLeft
            default:
                break
            }
        }
    }
}
