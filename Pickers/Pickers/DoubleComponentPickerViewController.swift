//
//  DoubleComponentPickerViewController.swift
//  Pickers
//
//  Created by Artsiom Sakratar on 6/7/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class DoubleComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var doublePicker: UIPickerView! // Выход пикера
    
    private let fillingComponent = 0 // Индекс селектора который будет содержать значения начинок
    private let breadComponent = 1 // Индекс селектора который будет содержать значения выпечки
    private let fillingTypes = ["Ham", "Tyrkey", "Peanut Butter", "Tuna Salad", "Chicken Salad", "Roast Beef", "Vegemite"] // Массив значений для начинок
    private let breadTypes = ["White", "Whole Wheat", "Rye", "Sourdough", "Seven Grain"] // Массив значений для выпечки
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Срабатывает при нажатии на кнопку
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let fillingRow = doublePicker.selectedRow(inComponent: fillingComponent) // Сохраняет индекс выбранного ряда селектора начинок
        let breadRow = doublePicker.selectedRow(inComponent: breadComponent) // Сохраняет индекс выбранного ряда селектора выпечки
        
        let filling = fillingTypes[fillingRow] // Сохраняет значение которое находится на выбранном ряду селектора начинок
        let bread = breadTypes[breadRow] // Сохраняет значение которое находится на выбранном ряду селектора выпечки
        let message = "Your \(filling) on \(bread) bread will be right up." // Сообщение для предупреждения
        
        let alert = UIAlertController(title: "Thank you for your order", message: message, preferredStyle: .alert) // Создается объект предупреждения
        let action = UIAlertAction(title: "Great", style: .default, handler: nil) // Создается объект действия предупреждения
        alert.addAction(action) // Действие добавляется в предупреждкение
        present(alert, animated: true, completion: nil) // Вывод предупреждения на экран
    }
    
    // MARK: -
    // MARK: Picker Data Source Methods
    // Настройка селекторов
    
    // Возвращает необхожимое количество селекторов для отрисовки, вызывается перед отображением селектора
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // Устанавливает количество рядов для каждого селектора, вызвается перед отображением для каждого селектора по его индексу
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == breadComponent { // Если метод вызывается для селектора выпечек
            return breadTypes.count // Возвращает количество элементов массива выпечек
        } else { // Если метод вызывается для селектора начинок
            return fillingTypes.count // Возвращает количество элементов массива начинок
        }
    }
    
    // MARK: -
    // MARK: Picker Delegate Methods
    
    // Заполнение селекторов значениями из массивов, вызывется перед отображением для каждого ряда селектора
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == breadComponent { // Если метод вызывается для селектора выпечек
            return breadTypes[row] // Возвращает значение выпечки находящееся в массиве по индексу ряда для которого вызывается метод
        } else { // Если метод вызывается для селектора начинок
            return fillingTypes[row] // Возвращает значение начинки находящееся в массиве по индексу ряда для которого вызывается метод
        }
    }
}

