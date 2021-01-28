//
//  ViewController.swift
//  QuartzFun
//
//  Created by Artsiom Sakratar on 25.01.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeColor(_ sender: UISegmentedControl) {
        let drawingColorSelection = DrawingColor(rawValue: Int(UInt(sender.selectedSegmentIndex)))
        
        if let drawingColor = drawingColorSelection {
            let funView = view as! QuartzFunView
            switch drawingColor {
            
            case .red:
                funView.currentColor = UIColor.red
                funView.useRandomColor = false
                
            case .blue:
                funView.currentColor = UIColor.blue
                funView.useRandomColor = false
                
            case .yellow:
                funView.currentColor = UIColor.yellow
                funView.useRandomColor = false
            
            case .green:
                funView.currentColor = UIColor.green
                funView.useRandomColor = false
                
            case .random:
                funView.useRandomColor = true
            }
        }
    }
    
    @IBAction func changeShape(_ sender: UISegmentedControl) {
        let shapeSelection = Shape(rawValue: Int(UInt(sender.selectedSegmentIndex)))
        if let shape = shapeSelection {
            let funView = view as! QuartzFunView
            funView.shape = shape
            colorControl.isHidden = shape == Shape.image
        }
    }
    
}

