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
        createCat()
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
    
    func createCat() {
        let x = (self.scene?.size.width)! / 4
        let y = (self.scene?.size.height)! / 3.5
        var cat:SKSpriteNode
       
        let cat1 = SKTexture.init(imageNamed: "cat1")
        cat1.filteringMode = .nearest
        let cat2 = SKTexture.init(imageNamed: "cat2")
        cat2.filteringMode = .nearest
        let animation = SKAction.animate(with: [cat1,cat2], timePerFrame: 0.2)
        let loop = SKAction.repeatForever(animation)
        
        cat = SKSpriteNode(texture: cat1)
        cat.size = CGSize(width: 160, height: 160)
        cat.position = CGPoint(x: x, y: y)
        cat.run(loop)
        
        let birdCategory: UInt32 = 1 << 0
        cat.physicsBody?.categoryBitMask = birdCategory
        
        self.addChild(cat)
    }
}
