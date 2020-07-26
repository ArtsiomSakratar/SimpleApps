//
//  FavoriteList.swift
//  Fonts
//
//  Created by Artsiom Sakratar on 6/21/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation
import UIKit

// Осуществляет реализацию избранных шрифтов
class FavoritesList {
    static let sharedFavoritesList = FavoritesList() // Создает экземпляр текущего класса который всегда будет в один и тот же (синглтон)
    private(set) var favorites: [String] // private(set) позволяет читать свойство вне класса но иземенять только в нутри класса
    
    // Конструктор, отвечает за установку начальных значений
    init() {
        let defaults = UserDefaults.standard // Создается объект для работы с словарем
        let storedFavorites = defaults.object(forKey: "favorites") as? [String] // Извлекает сохраненные данные из словаря и преобразует их в массив
        favorites = storedFavorites != nil ? storedFavorites! : [] // Если имеется сохраненный список шрифтов используем его для инициализации, иначе делаем его пустым
    }
    
    
    // Добавление шрифта
    func addFavorite(fontName: String) {
        // Если массив не содержит добовляемый шрифт
        if !favorites.contains(fontName) {
            favorites.append(fontName) // Добавляет шрифт в массив
            saveFavorites() // Обновляет словарь шрифтов
        }
    }
    
    // Удаление шрифта
    func removeFavorite(fontName: String) {
        // Если удаляемый шрифт есть в массиве то находит и сохраняет его индекс
        if let index = favorites.firstIndex(of: fontName) {
            favorites.remove(at: index) // Удаление значения из массива по индексу
            saveFavorites() // Обновляет словарь шрифтов
        }
    }
    
    // Реализация логики переупорядочения
    func moveItem(fromIndex from: Int, toIndex to: Int) {
        let item = favorites[from] // Сохраняется элемент поизиции из которой будет перемещен элемент
        favorites.remove(at: from) // Удаляется перетаскиваемый элемент из массива
        favorites.insert(item, at: to) // Перетаскиваемый элемент вставляется в необходимую позизицию
        saveFavorites() // Обновление массива
    }
    
    // Сохранение/Обновление шрифтов
    private func saveFavorites() {
        let defaults = UserDefaults.standard // Создается объект для работы с словарем
        defaults.set(favorites, forKey: "favorites") // Добавление значения в словарь
        defaults.synchronize() // Синхронизация/Обновление словоря
    }
    
    // Объект UserDefaults это словарь который позволяет сохранять данные даже после того как приложение остановлено или закрыто
}
