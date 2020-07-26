//
//  SingleComponentPickerViewController.swift
//  Pickers
//
//  Created by Artsiom Sakratar on 6/7/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class SingleComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var singlePicker: UIPickerView! // Выход селектора
    
    private let charaterNames = ["Luke", "Leia", "Han", "Chewbacca", "Artoo", "Treepio", "Lando"] // Массив строк для заполнения селектора
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Срабатывает при нажатии на кнопку
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let row = singlePicker.selectedRow(inComponent: 0) // Сохраняет индекс выбранного значяения на селекторе, inComponent — номер/индекс селектора
        let selected = charaterNames[row] // Сохраняет значение массива соответствующее выбранному на селекторе
        let title = "You selected \(selected)!" // Заголовок для предупреждения
        
        let alert = UIAlertController(title: title, message: "Thank you for choosing", preferredStyle: .alert) // Создается объект предупреждения
        let action = UIAlertAction(title: "You're welcome", style: .default, handler: nil) // Создается объект действия предупреждения
        alert.addAction(action) // Добавление действия к предупреждению
        present(alert, animated: true, completion: nil) // Выводит предупреждение на экран
    }
    
    // MARK: -
    // MARK: Picker Data Source Methods
    // Настройка селектора
    
    // Возвращает количество необходимых селекторов
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Возвращает количество необходимых рядов в селекторе
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return charaterNames.count
    }
    
    // MARK: Picker Delegate Methods
    
    // Вызываеься для установки значения для каждого ряда селектора
    // Каждому ряду селектора будет присвоено соответствующее значение из массива имен (ряду 0 будет присвоено значение массива с индексом 0)
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return charaterNames[row]
    }
}
