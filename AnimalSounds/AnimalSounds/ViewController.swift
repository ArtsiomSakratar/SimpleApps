//
//  ViewController.swift
//  AnimalSounds
//
//  Created by Artsiom Sakratar on 2/26/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var animalSoundLabel: UILabel!
    
    let catSound = SimpleSound(named: "meow")
    let dogSound = SimpleSound(named: "woof")
    let cowSound = SimpleSound(named: "moo")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func CatButtonDidPressed(_ sender: UIButton) {
        animalSoundLabel.text = "Meow!"
        catSound.play()
    }
    @IBAction func DogButtonDidPressed(_ sender: UIButton) {
        animalSoundLabel.text = "Woof"
        dogSound.play()
    }
    @IBAction func CowButtonDidPressed(_ sender: UIButton) {
        animalSoundLabel.text = "Moo!"
        cowSound.play()
    }
    
}

