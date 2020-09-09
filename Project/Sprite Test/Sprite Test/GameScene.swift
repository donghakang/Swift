//
//  GameScene.swift
//  Sprite Test
//
//  Created by Dongha Kang on 2020/09/04.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
        }
    }
    
    override func didMove(to view: SKView) {
        
        self.view?.isMultipleTouchEnabled = true                // 터치를 여러개 할 수 있는가
        
        
        // 화면에 글자를 출력
        let label = SKLabelNode(text: "Hello")
        label.position = CGPoint(x: 50, y: 50)
        label.fontSize = 48
        
        self.addChild(label)
        
        // 움직임 모션
        let action = SKAction.move(to: CGPoint(x: 500, y:500), duration: 1)
        let waiting = SKAction.wait(forDuration: 2)
        let action2 = SKAction.rotate(toAngle: CGFloat(45 * Double.pi / 180), duration: 1)
        
        let seq = SKAction.sequence([action, waiting, action2])              // sequence 는 순서대로,
        label.run(seq)
    }
    
   
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
