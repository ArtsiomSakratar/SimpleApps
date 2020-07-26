//
//  FontSizeViewController.swift
//  Fonts
//
//  Created by Artsiom Sakratar on 6/22/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class FontSizesViewController: UITableViewController {
    
    var font: UIFont! // Текущий шрифт
    private static let pointSizes: [CGFloat] = [
        9, 10, 11, 12, 13, 14, 18, 24, 36, 48, 64, 72, 96, 144
    ] // Размеры шрифта для отображения
    private static let cellIdentifier = "FontNameAndSize" // Идентификатор для ячеек

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = FontSizesViewController.pointSizes[0] // Указывается примерная оценка высоты строк (рядов) таблицы, благодаря этому прорисовка строк разного рамера просиходит быстрее, таблица самостоятельно высчитывает высоту строк для каждой ячейки
    }
    
    // Установка шрифта для отображения
    func fontForDisplay(atIndexPath indexPath: NSIndexPath) -> UIFont {
        let pointSize = FontSizesViewController.pointSizes[indexPath.row] // Устанавливает размер шрифта в соответствии с индексом ячейки
        return font.withSize(pointSize) // Возвращает шрифт установленного размера
    }

    // MARK: - Table view data source

    // Устанавливает количество рядов
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FontSizesViewController.pointSizes.count
    }

    // Реализация ячеек
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FontSizesViewController.cellIdentifier, for: indexPath) // Создается объект ячейки
        
        cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath as NSIndexPath) // Задается шрифт ячейки
        cell.textLabel?.text = font.fontName // Задается текст ячейки
        cell.detailTextLabel?.text = "\(FontSizesViewController.pointSizes[indexPath.row]) point" // Задается детализированный тект ячейки
        
        return cell // Возвращается готовая ячейка
    }
    
}
