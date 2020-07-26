//
//  MasterViewController.swift
//  Presidents
//
//  Created by Artsiom Sakratar on 7/4/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

// Контроллер бокового списка
class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil // Объект контроллера информации
    var presidents: [[String: String]]! // Массив для хранения данных

    override func viewDidLoad() {
        super.viewDidLoad()

        let path = Bundle.main.path(forResource: "PresidentList", ofType: "plist")! // Получает путь к файлу с данными
        let presidentInfo = NSDictionary(contentsOfFile: path)! // Получаем словарь данных из файла
        presidents = (presidentInfo["presidents"]! as! [[String: String]]) // Получает данные в массив из словаря
 
        // Если контроллер в режиме split
        if let split = splitViewController {
            let controllers = split.viewControllers // Получает массив контроллеров в зависимотсти от отображения
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController // Приводит отображение контроллеров к виду зависящему от режима просмотра приложения
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed // Убирает выделеное меню в мастере
        super.viewWillAppear(animated)
    }

    // MARK: - Segues

    // Срабатывает при переходе
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Срабатывает при переходе по определенному идентификатору
        if segue.identifier == "showDetail" {
            // Разворачивает и получает индекс нажатой ячейки
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = presidents[indexPath.row] // Получает словарь соответствующий нажатой ячейки
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController // Получает объект контроллера на который произойдет переход
                // Если до этого был отображен контроллер детализации информации
                if let oldController = detailViewController {
                    controller.languageString = oldController.languageString // Получает язык который был выбран на старой странице и изменяет его на текущей
                }
                controller.detailItem = object as AnyObject? // Передает данные для отображения
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem  // Настройка отображения кнопки возврата
                controller.navigationItem.leftItemsSupplementBackButton = true // Настройка кнопки возврата
                detailViewController = controller // Получает ссылку объекта на который произойдет переход
            }
        }
    }

    // MARK: - Table View

    // Колличество секций в мастере
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Количество рядов в мастере
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presidents.count
    }

    // Формирование ячеек мастера
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) // Получает объект ячейки с помощью очереди
        let president = presidents[indexPath.row] // Получает словарь соответствующий индексу ячейки
        cell.textLabel!.text = president["name"] // Задает тексту ячейки значение словоря
        return cell // Возвращает ячейку
    }

    
}
