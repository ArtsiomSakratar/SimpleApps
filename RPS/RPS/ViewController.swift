//
//  ViewController.swift
//  RPS
//
//  Created by Artsiom Sakratar on 2/26/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var robotButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var playerScore = 0
    var robotScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.isHidden = true
        resetButton.isHidden = true
    }
    
    func play(_ sign: Sign) {
        let computerSign = randomSign()
        robotButton.setTitle(computerSign.emoji, for: .normal)
        
        switch sign {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
        }
        
        scoreLabel.isHidden = false
        resetButton.isHidden = false
        
        let result = sign.takeTurn(computerSign)
        
        switch result {
        case .win:
            statusLabel.text = "It's a win!"
            playerScore += 1
            scoreLabel.text = "\(playerScore) : \(robotScore)"
            self.view.backgroundColor = UIColor.green
        case .lose:
            statusLabel.text = "You lose!"
            robotScore += 1
            scoreLabel.text = "\(playerScore) : \(robotScore)"
            self.view.backgroundColor = UIColor.red
        case .draw:
            statusLabel.text = "It's a draw!"
            self.view.backgroundColor = UIColor.gray
        case .start:
            reset()
        }
    }
    
    func reset() {
        statusLabel.text = "Rock, Paper, Scissors"
        self.view.backgroundColor = UIColor.white
        
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        resetButton.isHidden = false
        
        resetButton.isHidden = true
    }
    
    // MARK: - IBAction
    
    @IBAction func rockButtonPressed(_ sender: UIButton) {
        play(.rock)
    }
    @IBAction func paperButtonPressed(_ sender: UIButton) {
        play(.paper)
    }
    @IBAction func scissorsButtonPressed(_ sender: UIButton) {
        play(.scissors)
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        reset()
    }
}

