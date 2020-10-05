//
//  GameViewController.swift
//  Sprite Test
//
//  Created by Dongha Kang on 2020/09/04.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 640x1136 크기의 게임 신을 만든다
        let scene = GameScene(size: CGSize(width: 640, height: 1136))
        
        // Main.storyboard 의 View를 SKView 로 전환
        let skView = self.view as! SKView
        
        // 화면 모드를 화면 크기에 맞게 확대 축소하는 모드로 설정
        scene.scaleMode = .aspectFit
        
        // SkView에 출력
        skView.presentScene(scene)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
