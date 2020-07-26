//
//  ViewController.swift
//  Todo
//
//  Created by Artsiom Sakratar on 2/16/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var todoItems: [TodoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CreateTodoViewController, segue.identifier == "CreateTodo" {
            vc.delegate = self
        }
    }
    
}


extension ViewController: TodoCreateDelegate {
    func addTodo(todo: TodoModel) {
        todoItems.append(todo)
        tableView.reloadData()
    }
}

extension  ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell") as! TodoTableViewCell
        cell.todoLabel.text = todoItems[indexPath.row].text
        cell.checkBoxView.layer.cornerRadius = 12
        cell.checkBoxView.layer.borderWidth = 1
        cell.checkBoxView.layer.borderColor = UIColor.gray.cgColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todoItems.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}
