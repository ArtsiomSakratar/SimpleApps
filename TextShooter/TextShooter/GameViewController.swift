//
//  GameViewController.swift
//  TextShooter
//
//  Created by Artsiom Sakratar on 29.01.21.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = StartScene(size: view.frame.size)
        
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        skView.ignoresSiblingOrder = true
        
        skView.presentScene(scene)
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations :  UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
}


