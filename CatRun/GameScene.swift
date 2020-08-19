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
    
    func createBackground() {
        for loop in 0 ... 2 {
            let background = SKSpriteNode(imageNamed: "bg")
            background.size = CGSize(width: (self.scene?.size.width)!, height: (self.scene?.size.height)!)
            background.position = CGPoint(x: CGFloat(loop) * self.frame.size.width, y: self.frame.size.height / 2)
            self.addChild(background)
        }
    }
}
