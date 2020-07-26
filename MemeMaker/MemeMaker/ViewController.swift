//
//  ViewController.swift
//  MemeMaker
//
//  Created by Artsiom Sakratar on 2/27/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topCaptionSegmentControl: UISegmentedControl!
    @IBOutlet weak var topLable: UILabel!
    @IBOutlet weak var bottomLable: UILabel!
    @IBOutlet weak var bottomSegmentControl: UISegmentedControl!
    
    var topChoices = [CaptionOption]()
    var bottomChoices = [CaptionOption]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTopSegmentControl()
        configureBottomSegmentControl()
        selectInitValues()
    }
    
    func configureTopSegmentControl() {
        topCaptionSegmentControl.removeAllSegments()
        
        let option1 = CaptionOption(emoji: "🕶", text: "You know what's cool?")
        let option2 = CaptionOption(emoji: "💥", text: "You knoe that makes me mad?")
        let option3 = CaptionOption(emoji: "💕", text: "You knoe that what I love?")
        topChoices = [option1, option2, option3]
        
        for choice in topChoices {
            topCaptionSegmentControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
    }
    
    func configureBottomSegmentControl() {
        bottomSegmentControl.removeAllSegments()
        
        let option1 = CaptionOption(emoji: "🐱", text: "Cats wearing hats")
        let option2 = CaptionOption(emoji: "🐕", text: "Dogs carrying logs")
        let option3 = CaptionOption(emoji: "🙉", text: "Monkey being funky")
        bottomChoices = [option1, option2, option3]
        
        for choice in bottomChoices {
            bottomSegmentControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
    }
    
    func selectInitValues() {
        topCaptionSegmentControl.selectedSegmentIndex = 0
        bottomSegmentControl.selectedSegmentIndex = 0
        topLable.text = topChoices.first?.text
        bottomLable.text = bottomChoices.first?.text
    }
    
    @IBAction func topSegmentValueChanged(_ sender: UISegmentedControl) {
        let currentChoice = topChoices[sender.selectedSegmentIndex]
        topLable.text = currentChoice.text
    }
    @IBAction func bottomSegmentValueChanged(_ sender: UISegmentedControl) {
        let currentChoice = bottomChoices[sender.selectedSegmentIndex]
        bottomLable.text = currentChoice.text
    }
}

