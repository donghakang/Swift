//
//  ViewController.swift
//  0930
//
//  Created by Dongha Kang on 2020/09/28.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var yy: UILabel!
    @IBOutlet weak var mm: UILabel!
    @IBOutlet weak var dd: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var btn: UIButton!
    
    var audioPlayer = AVAudioPlayer()
    
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        setupAudio()
        audioPlayer.play()
        setup()
        addGesture()
    }

    
    func setup() {
        yy.alpha = 0.0
        mm.alpha = 0.0
        dd.alpha = 0.0
        label1.alpha = 0.0
        label2.alpha = 0.0
        label3.alpha = 0.0
        btn.alpha = 0.0
        
        
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = btn.bounds.size.width / 2
    }
    
    @IBAction func btnClick(_ sender: Any) {
        audioPlayer.setVolume(0, fadeDuration: 5)
    }
    
}

// MARK: Gesture Recognizer
extension ViewController {
    func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHandler(sender:)))
        
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapHandler(sender: UITapGestureRecognizer) {
        count += 1
        if (count == 1) {
            UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.yy.alpha = 1.0
            }, completion: nil)
            
        }
        if (count == 2) {
            UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.mm.alpha = 1.0
            }, completion: nil)
        }
        if (count == 3) {
            UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.dd.alpha = 1.0
            }, completion: nil)
        }
        if (count == 4) {
            UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.label1.alpha = 1.0
            }, completion: nil)
        }
        if (count == 5) {
            UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.label2.alpha = 1.0
            }, completion: nil)
        }
        if (count == 6) {
            UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.label3.alpha = 1.0
            }, completion: nil)
        }
        if (count == 7) {
            UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.btn.alpha = 1.0
            }, completion: nil)
        }
        
    }
}


extension ViewController {
    func setupAudio() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "radical_notion", ofType: ".mp3")!))
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            audioPlayer.volume = 1.0
            
        } catch {
            print(error)
        }
    }
}
