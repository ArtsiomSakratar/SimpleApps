//
//  SKNode+Extra.swift
//  TextShooter
//
//  Created by Artsiom Sakratar on 31.01.21.
//

import SpriteKit

extension SKNode {
    @objc func receiveAttacker(_ attacker: SKNode, contact: SKPhysicsContact) {}
    @objc func friendlyBumpFrom(_ node: SKNode) {}
}
