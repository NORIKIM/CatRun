//
//  GameScene.swift
//  CatRun
//
//  Created by 김지나 on 2020/07/05.
//  Copyright © 2020 김지나. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        createBackground()
    }
    override func update(_ currentTime: TimeInterval) {
        scrollBackground()
    }
    
    func createBackground() {
        for loop in 0 ... 2 {
            let background = SKSpriteNode(imageNamed: "bg")
            background.name = "bg"
            background.size = CGSize(width: (self.scene?.size.width)!, height: (self.scene?.size.height)!)
            background.position = CGPoint(x: CGFloat(loop) * self.frame.size.width, y: self.frame.size.height / 2)
            self.addChild(background)
        }
    }
    
    func scrollBackground() {
        self.enumerateChildNodes(withName: "bg", using: ({ (node, error) in
            node.position.x -= 4
            
            if node.position.x < -self.frame.size.width {
                node.position.x += self.frame.size.width * 3
            }
        }))
    }
}
