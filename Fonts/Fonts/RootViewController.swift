//
//  RootViewController.swift
//  Fonts
//
//  Created by Artsiom Sakratar on 6/21/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

// Корневое представление приложения
class RootViewController: UITableViewController {
    
    private var familyNames: [String]! // Стандартные шрифты
    private var cellPointSize: CGFloat! // Размер для ячейки
    private var favoritesList: FavoritesList! // Избранные шрифты
    private static let familyCell = "FamilyName" // Идентификатор ячейки системных шрифтов
    private static let favoritesCell = "Favorites" // Идентификатор ячейки избранных шрифтов

    // Срабатывает один раз при первом появлении представления
    override func viewDidLoad() {
        super.viewDidLoad()
        
        familyNames = (UIFont.familyNames as [String]).sorted() // Формируется отсортированный массив всех доступных шрифтов класса UIFont
        let preferredTableViewFont = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline) // Запрашивает предпочтительный шрифт для заголовка, задаваемый пользователем в системных настройках (Settings)
        cellPointSize = preferredTableViewFont.pointSize // Сохраняет базовый размер шрифта, который будет исполтзоваться в везде в этом контроллере
        favoritesList = FavoritesList.sharedFavoritesList // Получен синглтон с объектом списка предпочитаемых шрифтов
        tableView.estimatedRowHeight = cellPointSize // Указывается примерная оценка высоты строк (рядов) таблицы, благодаря этому прорисовка строк разного рамера просиходит быстрее, таблица самостоятельно высчитывает высоту строк для каждой ячейки
    }
    
    // Срабатывает каждый раз при появлении представления
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData() // Перегрузка табличного представления
    }
    
    // Определяет шрифт для ячейки
    func fontForDisplay(atIndexPath indexPath: NSIndexPath) -> UIFont? {
        // Если ячейка отночится к первой секции, т.е. к разделу системных шрифтов
        if indexPath.section == 0 {
            let familyName = familyNames[indexPath.row] // Получает название их списка отсортированных шрифтов соответствующее индексу ячейки
            let fontName = UIFont.fontNames(forFamilyName: familyName).first // Получает первый (основной) шрифт из СЕМЕЙСТВА необходимого шрифта
            return fontName != nil ? UIFont(name: fontName!, size: cellPointSize) : nil // Если шрифт есть в классе UIFont, то возвращает найденный шрифт
        } else {
            return nil
        }
    }

    // MARK: - Table view data source

    // Количество секций
    override func numberOfSections(in tableView: UITableView) -> Int {
        return favoritesList.favorites.isEmpty ? 1 : 2 // Если список избранных пуст, то 1 секция
    }

    // Количество строк в секции
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? familyNames.count : 1 // В секции шрифтов количество строк будет равно количеству шрифтов, а в избранном — 1 ячейка
    }
    
    // Уставливает названия для секций
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "All Font Families" : "My Favorite Fonts"
    }
    
    // Формирование ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 { // Если ячейка будет относится к секции шрифтов
            let cell = tableView.dequeueReusableCell(withIdentifier: RootViewController.familyCell, for: indexPath) // Создается стандартный объект ячейки который будет соответствовать шаблону ячейки из раскадровки согласно идентификатору
            cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath as NSIndexPath) // Здается шрифт текста ячейки через метод fontForDisplay
            cell.textLabel?.text = familyNames[indexPath.row] // Задается текст ячейки как название соответствующего шрифта
            cell.detailTextLabel?.text = familyNames[indexPath.row] // Задается деталезированый текст ячейки как название соответствующего шрифта
            return cell // Возваращает созданную ячейку
        } else { // Если ячейка относится к избранному
            return tableView.dequeueReusableCell(withIdentifier: RootViewController.favoritesCell, for: indexPath) // Возвращается стандартный объект ячейки который будет соответствовать шаблону ячейки из раскадровки согласно идентификатору
        }
    }

    // MARK: - Navigation
    
    // Вызывается перед переходом на другой контроллер при нажатии на ячейку
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)! // Получает indexPath ячейки с которой произошло взаимодействие и сохраняет его
        let listVC = segue.destination as! FontListViewController // Создается объект контроллера на который произайдет переход (который будет выводится)
        
        if indexPath.section == 0 { // Если нажата ячейка списка шрифтов
            let familyName = familyNames[indexPath.row] // Получает название семейства шрифтов соответствущее ячейке
            listVC.fontNames = (UIFont.fontNames(forFamilyName: familyName) as [String]).sorted() // Получает семейство шрифтов и сортирует его
            listVC.navigationItem.title = familyName // Задает заголовок контроллеру на который произайдет переход
            listVC.showsFavorites = false // Отключает показ избранного в контроллере списка шрифтов
        } else {
            listVC.fontNames = favoritesList.favorites // Получает список избранных шрифтов и передает их контроллеру списка шрифтов
            listVC.navigationItem.title = "Favorites" // Задает заголовок списку избранных шрифтов
            listVC.showsFavorites = true // Включает показ избранных шрифтов в контроллере списка шрифтов
        }
    }
    
}
