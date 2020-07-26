//
//  GameScene.swift
//  MyFlappyBird
//
//  Created by Artsiom Sakratar on 2/18/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var backgroundNode : SKNode!
    var birdNote: SKSpriteNode!
    var gameOverLabel : SKLabelNode!
    
    override func didMove(to view: SKView) {
        backgroundNode = self.childNode(withName: "background")!
        birdNote = (self.childNode(withName: "bird") as! SKSpriteNode)
        gameOverLabel = (self.childNode(withName: "gameOverLabel") as! SKLabelNode)
        
        gameOverLabel.alpha = 0
         
        self.physicsWorld.contactDelegate = self
        
        let moveBackground = SKAction.move(by: CGVector(dx: -500, dy: 0), duration: 10)
        
        backgroundNode.run(moveBackground)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        birdNote.physicsBody!.applyImpulse(CGVector(dx: 0, dy: 3))
    }
    
    func stopGame() {
        backgroundNode.removeAllActions()
        birdNote.physicsBody!.pinned = true
        gameOverLabel.run(SKAction.fadeIn(withDuration: 0.5))
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        stopGame()
    }
}
