//
//  ViewController.swift
//  ColorMix
//
//  Created by Artsiom Sakratar on 2/26/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var MixView: UIView!
    
    @IBOutlet weak var RedSwitch: UISwitch!
    @IBOutlet weak var GreenSwitch: UISwitch!
    @IBOutlet weak var BlueSwitch: UISwitch!
    
    @IBOutlet weak var RedSlider: UISlider!
    @IBOutlet weak var GreenSlider: UISlider!
    @IBOutlet weak var BlueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MixView.layer.cornerRadius = MixView.bounds.height/2
        MixView.layer.borderColor = UIColor.black.cgColor
        MixView.layer.borderWidth = 3
    }
    
    @IBAction func RedAction(_ sender: UISwitch) {
        updateColor()
    }
    @IBAction func GreenAction(_ sender: UISwitch) {
        updateColor()
    }
    @IBAction func BlueAction(_ sender: UISwitch) {
        updateColor()
    }
    
    @IBAction func SliderUpdate(_ sender: UISlider) {
        updateSliders()
    }
    
    @IBAction func ResetButtonPressed(_ sender: UISwitch) {
        MixView.backgroundColor = UIColor.clear
        RedSwitch.isOn = false
        GreenSwitch.isOn = false
        BlueSwitch.isOn = false
        
        RedSlider.value = 0.0
        GreenSlider.value = 0.0
        BlueSlider.value = 0.0
    }
    
    
    // MARK: - Helpers
    
    func updateColor() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        if RedSwitch.isOn {
            red = CGFloat(RedSlider.value)
        }
        if GreenSwitch.isOn {
            green = CGFloat(GreenSlider.value)
        }
        if BlueSwitch.isOn {
            blue = CGFloat(BlueSlider.value)
        }
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        MixView.backgroundColor = color
    }
    
    func updateSliders() {
        updateColor()
    }
}

