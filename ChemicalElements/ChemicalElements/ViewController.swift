//
//  ViewController.swift
//  ChemicalElements
//
//  Created by Artsiom Sakratar on 2/26/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let elementList = ["Carbon", "Gold", "Chlorine", "Sodium"]
    var currentElementIndex = 0

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateElement()
    }
    
    func updateElement() {
        answerLabel.text = "?"
        let elementName = elementList[currentElementIndex]
        let image = UIImage(named: elementName)
        imageView.image = image
    }

    @IBAction func showAnswerButtonDidPressed(_ sender: UIButton) {
        answerLabel.text = elementList[currentElementIndex]
    }
    @IBAction func nextElementDidPressed(_ sender: Any) {
        currentElementIndex += 1
        if currentElementIndex >= elementList.count {
            currentElementIndex = 0
        }
        updateElement()
    }
    
}

