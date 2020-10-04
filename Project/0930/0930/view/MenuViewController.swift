//
//  MenuViewController.swift
//  0930
//
//  Created by Dongha Kang on 2020/09/29.
//

import UIKit
import AVFoundation

class MenuViewController: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    var audioPlayer1 = AVAudioPlayer()
    var audioPlayer2 = AVAudioPlayer()
    var audioPlayer3 = AVAudioPlayer()
    var audioPlayer4 = AVAudioPlayer()
    var buttonAudioPlayer = AVAudioPlayer()
    var endingAudioPlayer = AVAudioPlayer()
    
    var isBackground = false
    var isEnded = false
    
    static let message1: String = "우선, 우리의 노래를 감상하세요."
    static let message: String = "푸른아, 고생많았어,\n\n오늘은 너가 주인공이야. 맞는 말이기도 하고 틀린 말이기도해.\n\n너가 생일이라서 주인공인거는 맞지만, 오늘 뿐만 아니라 매일매일 너가 주인공이라는 거를 꼭 알아줬으면 좋겠어. \n\n지금까지 잘버텨줘서 고맙고, 같이 험한 길을 걸어줘서 고맙고.\n\n비록 지금은 이 애플리케이션에 버튼이 4개 밖에 없지만, 앞으로 너와의 같이 걸어가면 버튼이 수십개가 되겠지.\n\n그때 까지 이쁜 그림 그리자.\n\n created by your soulmate."
    var messenger: UILabel = {
        let messenger = UILabel()
        messenger.text = message1
        messenger.textAlignment = .left
        messenger.textColor = .white
        messenger.font = UIFont(name: "Jalnan", size: 50)
        messenger.numberOfLines = 0
        messenger.sizeToFit()
        messenger.translatesAutoresizingMaskIntoConstraints = false
        
        return messenger
    }()
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        backgroundAnimation()
        setupButton()
        setupAudio()
        
        extractedFunc()
        addGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        buttonAnimation()
        playAudio()
        if (isFirst && isSecond && isThird && isFourth) {
            isEnded = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.buttonDisappear()
                self.playAudio()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.endingAudioPlayer.play()
                    UIView.animate(withDuration: 10, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.6, options: .curveEaseOut, animations: {
                        self.view.backgroundColor = UIColor(red: 0, green: 125/255, blue: 1, alpha: 1)
                        self.messenger.alpha = 1.0
                    }, completion: { _ in
                        UIView.animate(withDuration: 10, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                            self.messenger.alpha = 0.0
                        }, completion: { _ in
                            self.messenger.text = MenuViewController.message
                            self.messenger.font = UIFont(name: "Jalnan", size: 20)
                            UIView.animate(withDuration: 10, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                                self.messenger.alpha = 1.0
                            }, completion: nil)
                        })})
                    
                }
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        btn1.frame = CGRect(x: -35, y:50 ,width: 0, height: 0)
        btn2.frame = CGRect(x: 180, y:230 ,width: 0, height: 0)
        btn3.frame = CGRect(x: -15, y:400 ,width: 0, height: 0)
        btn4.frame = CGRect(x: 140, y:550 ,width: 0, height: 0)
        
    }
    
    
    
    @IBAction func btn1Click(_ sender: Any) {
        buttonAudioPlayer.play()
    }
    @IBAction func btn2Click(_ sender: Any) {
        buttonAudioPlayer.play()
    }
    @IBAction func btn3Click(_ sender: Any) {
        buttonAudioPlayer.play()
    }
    @IBAction func btn4Click(_ sender: Any) {
        buttonAudioPlayer.play()
    }
    
    
    // set up final message
    fileprivate func extractedFunc() {
        view.addSubview(messenger)
        
        NSLayoutConstraint.activate([
            messenger.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messenger.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            messenger.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            messenger.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        ])
        
        messenger.alpha = 0.0
    }
    

}



// MARK: setup Button
extension MenuViewController {
    func setupButton() {
        
        btn1.backgroundColor = UIColor(red: 0, green: 189/255, blue: 254/255, alpha: 1)
        btn2.backgroundColor = UIColor(red: 0, green: 203/255, blue: 254/255, alpha: 1)
        btn3.backgroundColor = UIColor(red: 90/255, green: 222/255, blue: 255/255, alpha: 1)
        btn4.backgroundColor = UIColor(red: 132/255, green: 228/255, blue: 247/255, alpha: 1)
        
        btn1.frame = CGRect(x: -35, y:50 ,width: 0, height: 0)
        btn2.frame = CGRect(x: 180, y:230 ,width: 0, height: 0)
        btn3.frame = CGRect(x: -15, y:400 ,width: 0, height: 0)
        btn4.frame = CGRect(x: 140, y:550 ,width: 0, height: 0)
    
        btn1.layer.cornerRadius = btn1.frame.width / 2
        btn2.layer.cornerRadius = btn2.frame.width / 2
        btn3.layer.cornerRadius = btn3.frame.width / 2
        btn4.layer.cornerRadius = btn4.frame.width / 2
        
        btn1.setTitleColor(.white, for: .normal)
        btn2.setTitleColor(.white, for: .normal)
        btn3.setTitleColor(.white, for: .normal)
        btn4.setTitleColor(.white, for: .normal)
        
        
        btn1.titleLabel?.font = UIFont(name: "Jalnan", size: 20)
        btn2.titleLabel?.font = UIFont(name: "Jalnan", size: 20)
        btn3.titleLabel?.font = UIFont(name: "Jalnan", size: 20)
        btn4.titleLabel?.font = UIFont(name: "Jalnan", size: 20)
        
        btn1.setTitle("B", for: .normal)
        btn2.setTitle("B", for: .normal)
        btn3.setTitle("M", for: .normal)
        btn4.setTitle("K", for: .normal)
    }
}

// MARK: Audio
extension MenuViewController {
    func setupAudio() {
        do {
            audioPlayer1 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "zapsplat_cartoon_pop_medium_48207", ofType: ".mp3")!))
            audioPlayer1.prepareToPlay()
            audioPlayer2 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "zapsplat_cartoon_pop_medium_48207", ofType: ".mp3")!))
            audioPlayer2.prepareToPlay()
            audioPlayer3 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "zapsplat_cartoon_pop_medium_48207", ofType: ".mp3")!))
            audioPlayer3.prepareToPlay()
            audioPlayer4 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "zapsplat_cartoon_pop_medium_48207", ofType: ".mp3")!))
            audioPlayer4.prepareToPlay()
            
            audioPlayer1.volume = 0.5
            audioPlayer2.volume = 0.5
            audioPlayer3.volume = 0.5
            audioPlayer4.volume = 0.5
            
        
            buttonAudioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "zapsplat_cartoon_pop_mouth_011_46674", ofType: ".mp3")!))
            buttonAudioPlayer.prepareToPlay()
            buttonAudioPlayer.volume = 0.7
            
            endingAudioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "international", ofType: ".mp3")!))
            endingAudioPlayer.prepareToPlay()
            
            endingAudioPlayer.numberOfLoops = -1
        } catch {
            print(error)
        }
    }
    
    func playAudio() {
        if (isBackground) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
                self.audioPlayer1.play()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.audioPlayer2.play()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.audioPlayer3.play()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.audioPlayer4.play()
            }
        }
    }
}


// MARK: Animation
extension MenuViewController {
    func backgroundAnimation() {
        let firstAnimDuration = 2.0
        let secondAnimDuration = 2.0
        UIView.animate(withDuration: firstAnimDuration, animations: {
            /* Do here the first animation */
            self.view.backgroundColor = UIColor(red: 0, green: 155/255, blue: 1, alpha: 1)
        }) { (completed) in
           UIView.animate(withDuration: secondAnimDuration, animations: {
               /* Do here the second animation */
                self.view.backgroundColor = .white
           }, completion: { _ in
            self.isBackground = true
           })
        }
    }
    
    func buttonAnimation() {
        if (isBackground) {
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: .curveEaseOut, animations: {
                self.btn1.frame.size = CGSize(width: 300, height: 300)
                self.btn1.layer.cornerRadius = self.btn1.frame.width / 2
            }, completion: nil)
            
            UIView.animate(withDuration: 1.0, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: .curveEaseOut, animations: {
                self.btn2.frame.size = CGSize(width: 270, height: 270)
                self.btn2.layer.cornerRadius = self.btn2.frame.width / 2
            }, completion: nil)
            
            UIView.animate(withDuration: 1.0, delay: 0.4, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: .curveEaseOut, animations: {
                self.btn3.frame.size = CGSize(width: 280, height: 280)
                self.btn3.layer.cornerRadius = self.btn3.frame.width / 2
            }, completion: nil)
            
            UIView.animate(withDuration: 1.0, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: .curveEaseOut, animations: {
                self.btn4.frame.size = CGSize(width: 350, height: 350)
                self.btn4.layer.cornerRadius = self.btn4.frame.width / 2
            }, completion: nil)
        }
    }
    
    func buttonDisappear() {
        if (isBackground) {
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: .curveEaseOut, animations: {
                self.btn1.frame.size = CGSize(width: 0, height: 0)
            }, completion: nil)
            
            UIView.animate(withDuration: 1.0, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: .curveEaseOut, animations: {
                self.btn2.frame.size = CGSize(width: 0, height: 0)
            }, completion: nil)
            
            UIView.animate(withDuration: 1.0, delay: 0.4, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: .curveEaseOut, animations: {
                self.btn3.frame.size = CGSize(width: 0, height: 0)
            }, completion: nil)
            
            UIView.animate(withDuration: 1.0, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: .curveEaseOut, animations: {
                self.btn4.frame.size = CGSize(width: 0, height: 0)
            }, completion: nil)
        }
    }
}

// MARK: Gesture Recognizer
extension MenuViewController {
    func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHandler(sender:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapHandler(sender: UITapGestureRecognizer) {
        if (!isEnded) {
            buttonAnimation()
            playAudio()
        }
        
    }
}

