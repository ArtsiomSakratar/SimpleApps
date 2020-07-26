//
//  CreateTodoViewController.swift
//  Todo
//
//  Created by Artsiom Sakratar on 2/17/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

protocol TodoCreateDelegate {
    func addTodo(todo: TodoModel)
}

class CreateTodoViewController: UIViewController {
    @IBOutlet weak var todoTextField: UITextField!
    
    var delegate: TodoCreateDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func createTodo(_ sender: Any) {
        delegate?.addTodo(todo: TodoModel(text: todoTextField.text!))
        dismiss(animated: true, completion: nil)
    }
}


