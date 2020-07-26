//
//  DependentComponentPickerViewController.swift
//  Pickers
//
//  Created by Artsiom Sakratar on 6/7/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class DependentComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var dependentPicker: UIPickerView! // Выход селектора
    
    private let stateComponent = 0 // Индекс селектора штата
    private let zipComponent = 1 // Индекс селектора почтовых индексов
    private var stateZips: [String : [String]]! // Словарь в котором каждому штату (ключу) соостветствует массив почтовых индексов (значений)
    private var states: [String]! // Массив штатов
    private var zips: [String]! // Массив почтовых индексов

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Дополнительная настройка после загрузки представления.
        let bundle = Bundle.main // Сохраняет объект основного пакета который представляет текущее приложение, с его помощью может осуществляться доступ к ресурсам (файлам) проекта
        let plistURL = bundle.url(forResource: "statedictionary", withExtension: "plist") // Сохраняет путь файла где храняться данные
        stateZips = (NSDictionary.init(contentsOf: (plistURL)!) as! [String : [String]]) // Создается особый объект Словоря (NSDictionary) хранящий данные из файла по пути plistURL, который преобразуется в стандартный словарь языка Swift
        let allStates = stateZips.keys // Сохраняет все ключи словаря
        states = allStates.sorted() // Сохраняет остортированные ключи
        let selectedState = states[0] // Сохраняет перый элемент отсортированного массива ключей
        zips = stateZips[selectedState] // Сохраняет все почтовые индексы первого элемента
    }

    // Срабатывает при нажатии на кнопку
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let stateRow = dependentPicker.selectedRow(inComponent: stateComponent) // Сохраняет индекс выбраного ряда на селекторе штата
        let zipRow = dependentPicker.selectedRow(inComponent: zipComponent) // Сохраняет индекс выбраного ряда на селекторе почтового индекса
        
        let state = states[stateRow] // Сохраняет значение которое выбрано соответствуещее индексу выбранного ряда на селекторе штата
        let zip = zips[zipRow] // Сохраняет значение которое выбрано соответствуещее индексу выбранного ряда на селекторе почтового индекса
        
        let title = "You selected zip code \(zip)" // Заголовок для предуприждения
        let message = "\(zip) is in \(state)" // Сообщение для предуприждения
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert) // Создание объекта предуприждения
        let action = UIAlertAction(title: "OK", style: .default, handler: nil) // Создание объекта действия для предуприждения
        alert.addAction(action) // Добавление дествия к предуприждению
        present(alert, animated: true, completion: nil) // Вывод предуприждения на экран
    }
    
    // MARK: -
    // MARK: Picker Data Source Methods
    // Настройка селекторов
    
    // Возвращает количество селекторов для отображения
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // Возвращает количество рядов для каждого селектора
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == stateComponent {
            return states.count
        } else {
            return zips.count
        }
    }
    
    // MARK: -
    // MARK: Picker Delegate Methods
    // Работа селекторов
    
    // Заполняет значениями ряды селекторов при загрузке
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == stateComponent {
            return states[row]
        } else {
            return zips[row]
        }
    }
    
    // Заполняет и перерисовывает ряды при изменении штатов
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == stateComponent { // Если изменился ряд селектора штата
            let selectedState = states[row] // Сохраняется значение штата согласно индексу измененного ряда селектора штата
            zips = stateZips[selectedState] // Изменяет массив почтовых индексов на те которые соответствуют ключу выбранного штата
            dependentPicker.reloadComponent(zipComponent) // Перегружает селектор почтовых индексов
            dependentPicker.selectRow(0, inComponent: zipComponent, animated: true) // Выбирает первый элемент для показа после перегрузки селектора
        }
    }
    
    // Визуальная настройка отображения селекторов
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let pickerWidth = pickerView.bounds.size.width // Сохраняет ширину текущего селектора
        if component == zipComponent { // Если текущий селектор является почтовым
            return pickerWidth / 3 // Задает ширину в треть представления пикера
        } else { // Если текущий селектор для штатов
            return 2 * pickerWidth / 3 // Задает ширину в 2/3 от ширины представления пикера
        }
    }
}
