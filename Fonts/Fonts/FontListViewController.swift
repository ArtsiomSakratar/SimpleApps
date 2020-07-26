//
//  FontListViewController.swift
//  Fonts
//
//  Created by Artsiom Sakratar on 6/21/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class FontListViewController: UITableViewController {
    
    var fontNames: [String] = [] // Хранит список шрифтов для отображения
    var showsFavorites: Bool = false // Флаг показа избранных шрифтов
    private var cellPointSize: CGFloat! // Размер ячейки
    private static let cellIdentifier = "FontName" // Идентификатор ячейки
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preferredTableViewFont = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline) // Запрашивает предпочтительный шрифт для заголовка, задаваемый пользователем в системных настройках (Settings)
        cellPointSize = preferredTableViewFont.pointSize // // Сохраняет базовый размер шрифта, который будет исполтзоваться в везде в этом контроллере
        tableView.estimatedRowHeight = cellPointSize // Указывается примерная оценка высоты строк (рядов) таблицы, благодаря этому прорисовка строк разного рамера просиходит быстрее, таблица самостоятельно высчитывает высоту строк для каждой ячейки
        
        // Если показываются избранные шрифты
        if showsFavorites {
            navigationItem.rightBarButtonItem = editButtonItem // Добавляется кнопка редактирования в верхний правый угол
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Если показываются избранные шрифты
        if showsFavorites {
            fontNames = FavoritesList.sharedFavoritesList.favorites // Оновляет список шрифтов для отображения
            tableView.reloadData() // Перегружает представление
        }
    }
    
    // Установка шрифта для отображения
    func fontForDisplay(atIndexPath indexPath: NSIndexPath) -> UIFont {
        let fontName = fontNames[indexPath.row] // Получает шрифт соотвутствующий ячейке
        return UIFont(name: fontName, size: cellPointSize)! // Возвращет объект шрифта
    }
    
    // MARK: - Table view data source
    
    // Устанавливает количество рядов
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontNames.count
    }
    
    // Релизация ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FontListViewController.cellIdentifier, for: indexPath) // Создается объект ячейки
        cell.textLabel?.text = fontNames[indexPath.row] // Задается основной текст ячейки
        cell.detailTextLabel?.text = fontNames[indexPath.row] // задается детализированный текст ячейки
        
        return cell // Возвращает созданную ячейку
    }
    
    // Утснавливает возможность изменения отображения строк табличного представления
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return showsFavorites // Включается если отображаются избранные шрифты
    }
    
    // Вызывается после завершения редактирования табличного представления
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если стиль редактирования является удалением
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let favorite = fontNames[indexPath.row] // Получает название удаляемого шрифта
            FavoritesList.sharedFavoritesList.removeFavorite(fontName: favorite) // Удаление шрифта из избранного
            fontNames = FavoritesList.sharedFavoritesList.favorites // Обновляет список имен шрифтов текущего представления
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade) // Визуальное удаление ячейки
        }
    }
    
    // Вызывается после завершения перетаскивания
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        FavoritesList.sharedFavoritesList.moveItem(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row) // Изменяет данные согласно визуальному перемещению
        fontNames = FavoritesList.sharedFavoritesList.favorites // Обновляет список имен шрифтов текущего представления
    }
    
    // Вызывается перед переходом на другой контроллер при нажатии на ячейку
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tableViewCell = sender as! UITableViewCell // Получает объект ячейки с которым происходило взаимодействие
        let indexPath = tableView.indexPath(for: tableViewCell)! // Получает объекта индекса ячейки с которым происходило взаимодействие
        let font = fontForDisplay(atIndexPath: indexPath as NSIndexPath) // Получает шрифт ячейки с которым происходило взаимодействие
        
        // Если переход имеет идентификатор ShowFontSize
        if segue.identifier == "ShowFontSize" {
            let sizesVC = segue.destination as! FontSizesViewController // Создается объект контроллера на который произайдет переход (который будет выводится)
            sizesVC.title = font.fontName // Задается заголовок для выводимого контроллера
            sizesVC.font = font // Передается шрифт текущей ячейки
        } else {
            let infoVC = segue.destination as! FontInfoViewController // Создается объект контроллера на который произайдет переход (который будет выводится)
            infoVC.title = font.fontName // Задается заголовок для выводимого контроллера
            infoVC.font = font // Передается шрифт текущей ячейки
            infoVC.favorite = FavoritesList.sharedFavoritesList.favorites.contains(font.fontName) // Ищет совппадение шрифта ячейки в массиве массиве избранных шрифтов и передает результат в контроллер на который произайдет переход
        }
        
    }
    
}
