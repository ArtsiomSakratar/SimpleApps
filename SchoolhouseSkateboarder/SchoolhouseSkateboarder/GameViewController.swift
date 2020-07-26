//
//  GameViewController.swift
//  SchoolhouseSkateboarder
//
//  Created by Artsiom Sakratar on 5/19/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                
                // Корректирует размер сцены, чтобы он соответствовал представлению
                let width = view.bounds.width // Сохраняет ширину view
                let height = view.bounds.height // Сохраняет высоту view
                scene.size = CGSize(width: width, height: height) // Устанавливает ширину и высоту сцены согласно view
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
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
