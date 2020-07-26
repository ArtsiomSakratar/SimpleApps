//
//  LanguageListController.swift
//  Presidents
//
//  Created by Artsiom Sakratar on 7/5/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class LanguageListController: UITableViewController {
    
    weak var detailViewController: DetailViewController? = nil // Объект детализированного отображения
    private let languageNames: [String] = ["English", "French", "German", "Spanish"] // Названия языков для отображения
    private let languageCodes: [String] = ["en", "fr", "de", "es"] // Сокращения языков для url

    override func viewDidLoad() {
        super.viewDidLoad()

        // Отображение
        self.clearsSelectionOnViewWillAppear = false
        preferredContentSize = CGSize(width: 320, height: (languageCodes.count * 44))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    // MARK: - Table view data source

    // Количество секций
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Количество рядов
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageCodes.count
    }

    // Формирование ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) // Получает объект ячейки

        cell.textLabel!.text = languageNames[indexPath.row] // Задает текст ячейки

        return cell // Возвращает ячейку
    }
    
    // Срабатывает при выборе ячейки
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detailViewController?.languageString = languageCodes[indexPath.row] // Отправляет код выбранного языка в детализированное представление
        dismiss(animated: true, completion: nil) // Убирает меню выбора языка
    }

}
