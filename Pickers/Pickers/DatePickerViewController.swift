//
//  DatePickerViewController.swift
//  Pickers
//
//  Created by Artsiom Sakratar on 6/7/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker! // Выход селектора
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Настройка селектара перед загрузкой
        let date = NSDate() // Сохраняет объект текущей даты в переменную
        datePicker.setDate(date as Date, animated: false) // Устанавливает значения селектора согласно текущей дате
    }

    // Срабатывает при нажатии на кнопку
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let date = datePicker.date // Сохраняет значение селектора в переменную
        let message = "The date and time you selected is \(date)" // Сохраняет сообщение для будущего использования
        let alert = UIAlertController(title: "Date and Time Selected", message: message, preferredStyle: .alert) // Создается объект предупреждения с заголовком Title, сообщением message
        let action = UIAlertAction(title: "That's so true!", style: .default, handler: nil) // Создается объект действия предупреждения (кнопка) с надписью title, без логики
        alert.addAction(action) // Добавляет действие к предупреждению
        present(alert, animated:  true, completion: nil) // Выводит предупреждение на экран
    }
}
