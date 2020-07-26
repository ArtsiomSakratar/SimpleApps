//
//  ViewController.swift
//  TodoListApp
//
//  Created by Artsiom Sakratar on 2/17/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var items = ToDoItem.getDefaultData()
    let addDialog = UIAlertController(title: "Добавить дело", message: "Введите новое дело", preferredStyle: .alert)
    let editDialog = UIAlertController(title: "Редактировать дело", message: "Введите новый текст", preferredStyle: .alert)
    
    var selectedRowForEditing: IndexPath? = nil
    var selectedRowEditingSuccess: ((Bool) -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Список дел"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapOnAddButton))
        
        addDialog.addTextField(configurationHandler: nil)
        addDialog.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        addDialog.addAction(UIAlertAction(title: "Добавить", style: .default, handler: addNewItem))
        
        editDialog.addTextField(configurationHandler: nil)
        editDialog.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        editDialog.addAction(UIAlertAction(title: "Сохранить", style: .default, handler: editItem))
    }
    
    func addNewItem(action: UIAlertAction) {
        let Title = addDialog.textFields?[0].text
        let NewItem = ToDoItem(Title: Title!)
        items.append(NewItem)
        let Path = IndexPath(row: items.count - 1, section: 0)
        tableView.insertRows(at: [Path], with: .fade)
    }
    
    @objc func didTapOnAddButton() {
        addDialog.textFields?[0].text = ""
        self.present(addDialog, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todo_cell", for: indexPath)
        
        let item = items[indexPath.row]
        cell.textLabel?.text = item.Title
        
        let accessoryType: UITableViewCell.AccessoryType = item.IsCompleted ? .checkmark : .none
        cell.accessoryType = accessoryType
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        item.IsCompleted = !item.IsCompleted
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Изменить") { (action: UIContextualAction, view: UIView, success: @escaping (Bool) -> Void) in
            self.selectedRowForEditing = indexPath
            self.selectedRowEditingSuccess = success
            
            self.editDialog.textFields?[0].text = self.items[indexPath.row].Title
            self.present(self.editDialog, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func editItem(action: UIAlertAction) {
        let Title = editDialog.textFields?[0].text
        items[(selectedRowForEditing?.row)!].Title = Title!
        selectedRowEditingSuccess?(true)
        tableView.reloadRows(at: [selectedRowForEditing!], with: .fade)
    }
}
