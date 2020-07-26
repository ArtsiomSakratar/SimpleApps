//
//  ViewController.swift
//  Sections
//
//  Created by Artsiom Sakratar on 6/14/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let sectionsTableIdentifier = "SectionsTableIndentifier" // Индекнтификатор типа ячейки
    var names: [String: [String]]! // Словарь данных
    var keys: [String]! // Массив ключей словаря
    
    @IBOutlet weak var tableView: UITableView! // Выход табличного представления
    
    var searchController: UISearchController! // Контроллер поиска
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: sectionsTableIdentifier) // Регистрация класса ячейки по умолчанию, который должен выводится для каждой строки с помощью идентификатора
        
        // Извлечение данных из файла
        let path = Bundle.main.path(forResource: "sortednames", ofType: "plist") // сохранение пути к файлу с данными
        let namesDict = NSDictionary(contentsOfFile: path!) // Создание класса данных словоря
        names = (namesDict as! [String: [String]]) // Преобразование Класса словаря в обычный словарь
        keys = (namesDict!.allKeys as! [String]).sorted() // Преобразование ключей Класса словоря в массив и последующая его сортировка
        
        let resultsController = SearchResultsController() // Создается контроллер представления результатов
        resultsController.names = names // Добавление данных
        resultsController.keys = keys // Добавление ключей
        searchController = UISearchController(searchResultsController: resultsController) // Создается контроллер посика из созданного контроллера поиска результатов
        
        let searchBar = searchController.searchBar // Создание панели поиска
        searchBar.scopeButtonTitles = ["All", "Short", "Long"] // Добавление доп кнопок к панели поиска
        searchBar.placeholder = "Enter a search term" // Дабавление фонового текста
        searchBar.sizeToFit() // Установка высоты и ширины панели поиска подходящие для его содержимого
        tableView.tableHeaderView = searchBar // Установка панели поиска как представление заголовка таблицы
        searchController.searchResultsUpdater = resultsController // Необходимо для реализации поиска
        
        // Каждый раз, когда пользователь вводит что-то в строке поиска, объект класса UISearchController для обновления результатов поиска использует объект, хранящийся в свойстве searchResultsUpdater. Поиск выполняется в классе SearchResultsController, он должен соответствовать протоколу UISearchResultsUpdating
    }
    
    // MARK: - Table View Data Source Methods
    
    // Количество секций таблицы
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }
    
    // Количество ячеек для каждой секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section] // Находит текущий ключ
        let nameSection = names[key]! // Находит все значения ключа
        return nameSection.count // возвращает количество значений ключа
    }
    
    // Заголовок для каждой секции
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    // Реализация ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: sectionsTableIdentifier, for: indexPath) as UITableViewCell // Создание ячейки
        
        let key = keys[indexPath.section] // Находит ключ
        let nameSection = names[key]! // Находит значения ключа
        cell.textLabel?.text = nameSection[indexPath.row] // Задает текст ячейки соответствующий индексу отображаемой ячейки
        
        return cell // Возвращает сформированую ячейку
    }
    
    // Боковая панель быстрой навигации по секциям
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return keys
    }
}

