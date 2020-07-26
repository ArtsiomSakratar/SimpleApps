//
//  SearchResultsController.swift
//  Sections
//
//  Created by Artsiom Sakratar on 6/16/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class SearchResultsController: UITableViewController, UISearchResultsUpdating  {
    
    // Для кнопок фильтра
    private static let longNameSize = 6
    private static let shortNamesButtonIndex = 1
    private static let longNamesButtonIndex = 2
    
    let sectionsTableIdentifier = "SectionsTableIdentifier"
    var names:[String: [String]] = [String: [String]]() 
    var keys: [String] = []
    var filteredNames: [String] = [] // Массив отфильтрованных имен
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: sectionsTableIdentifier)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table View Data Source Methods
    
    // Количество ячеек отображаемых при поиске
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredNames.count
    }
    
    // Формирование ячеек
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: sectionsTableIdentifier) // Создание объекта ячейки
        cell!.textLabel?.text = filteredNames[indexPath.row] // Установка текста ячейки согласно отфильтрованным данным
        return cell! // Возвращает сформированную ячейку
        
    }
    
    // MARK: - UISearchResultsUpdating Conformance
    
    // Метод вызывается по мере ввода данных в строке поиска
    func updateSearchResults(for searchController: UISearchController) {
        
        // Сохраняет в переменную текст в поле поиска, если он есть
        if let searchString = searchController.searchBar.text {
            let buttonIndex = searchController.searchBar.selectedScopeButtonIndex // Сохраняет индекс выбранной кнопки фильтра поиска
            filteredNames.removeAll(keepingCapacity: true) // Очищается список отфильтрованных имен
            
            // Если строка не пустая
            if !searchString.isEmpty {
                
                // Замыкание, применяется для кажого элемента массива namesToKey
                // Реализует фильтрацию и поиск
                let filter: (String) -> Bool = { name in
                    let nameLength = name.count // Количество символов в строке
                    
                    // Если нажата нажата кнопка фильтра коротких имен и символов больше 7
                    // ИЛИ, Если нажата кнопка фильтра длинных имен и символов меньше 6
                    if (buttonIndex == SearchResultsController.shortNamesButtonIndex && nameLength >= SearchResultsController.longNameSize)
                        || (buttonIndex == SearchResultsController.longNamesButtonIndex && nameLength < SearchResultsController.longNameSize) {
                        
                        return false
                    }
                    
                    // Проверяет, является ли текст поиска подстрокой проверяемого значения в словаре
                    let range = name.range(of: searchString, options: NSString.CompareOptions.caseInsensitive, range: nil, locale: nil)
                    return range != nil // Возвращает true, если совпадение найдено
                }
                
                // Проходит по всем ключам
                for key in keys {
                    let namesForKey = names[key]! // Сохраняет массив значений ключа
                    let matches = namesForKey.filter(filter) // Используется метод filter() типа Array для которого небходимо реализовать замыкание
                    filteredNames += matches // Добавление релевантного значения в массив отфильтрованных имен
                }
            }
        }
        
        tableView.reloadData() // Обновление данных
    }
    
}
