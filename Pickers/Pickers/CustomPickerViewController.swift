//
//  CustomPickerViewController.swift
//  Pickers
//
//  Created by Artsiom Sakratar on 6/7/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit
import AudioToolbox

class CustomPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    private var winSoundID: SystemSoundID = 0 // Контейнер для звука выйгрыша
    private var crunchSoundID: SystemSoundID = 0 // Контейнер для звука трещетки
    
    private var images: [UIImage]! // Массив контейнеров для кратинок
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Дополнительная настройка после загрузки представления.
        // Добавление картинок из файлов ассетов
        images = [
            UIImage(named: "seven")!,
            UIImage(named: "bar")!,
            UIImage(named: "crown")!,
            UIImage(named: "cherry")!,
            UIImage(named: "lemon")!,
            UIImage(named: "apple")!
        ]
        winLabel.text = " " // Устанавливает метку выйгрыша пустой
        arc4random_stir() // Задает начальное значение генератора случайных чисел, позволяет избегать генерирования одинаковых последовательностей при каждом запуске приложения
    }
    
    // Показывает кнопку
    func showButton() {
        button.isHidden = false
    }
    
    // Воспроизведение звука выйгрыша
    func playWinSound() {
        if winSoundID == 0 { // Если котейнер для звука выйгрыша пуст
            let soundURL = Bundle.main.url(forResource: "win", withExtension: "wav")! as CFURL // Сохраняет путь к файлу звука выйгрыша с помощью основного пакета приложения и преобразует в объект для работы необходимого метода
            AudioServicesCreateSystemSoundID(soundURL, &winSoundID) // Создает объект для проигрывания звука, совмещая путь к файлу и котейнер для звука
        }
        
        AudioServicesPlaySystemSound(winSoundID) // Проигрывет звук выйгрыша
        winLabel.text = "WINNER!" // Изменяет метку выйгрыша согласно строки
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { // Метод позволяет делать задержку выполнения кода в 1.5 сек
            self.showButton() // Показывает кнопку
        }
    }
    
    // При нажатии на кнопку
    @IBAction func spin(_ sender: UIButton) {
        var win = false // Флаг выйгрыша
        var numInRow = -1 // Счетчик одинаковых изображений
        var lastVal = -1 // Хранит значение последнего изображения
        
        // Цикл запускается для всех селекторов
        for i in 0..<5 {
            let newValue = Int(arc4random_uniform(UInt32(images.count))) // Случайное число согласно количеству изображений
            if newValue == lastVal { // Если текущее значение равно предыдущему
                numInRow += 1 // Счетчик увеличивается
            } else {
                numInRow = 1 // Счетчик сбрасывается
            }
            lastVal = newValue // Сохранение текущего значения
            
            // Обновление текущего селектора по индексу i c новым значением
            picker.selectRow(newValue, inComponent: i, animated: true)
            picker.reloadComponent(i)
            
            // Если количество одинаковых значений подряд больше или равно 3
            if numInRow >= 3 {
                win = true
            }
        }
        
        // Реализация звука трещетки
        if crunchSoundID == 0 {
            let soundURL = Bundle.main.url(forResource: "crunch", withExtension: "wav")! as CFURL
            AudioServicesCreateSystemSoundID(soundURL, &crunchSoundID)
        }
        AudioServicesPlaySystemSound(crunchSoundID)
        
        // Если выйграли
        if win {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.playWinSound()
            }
        } else {
            // Внимание! Этот метод сработает в самом конце этого блока!
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.showButton()
            }
            
            // Эти строки сработают ДО асинхронного метода этого блока!
            button.isHidden = true
            winLabel.text = " "
        }
    }
    
    // MARK: -
    // MARK: Picker Data Source Methods
    // Настройка пикера
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    
    // MARK: -
    // MARK: Picker Delegate Methods
    
    // Устанвливает картинки для всех рядов
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let image = images[row] // Сохраняет картинку из массива
        let imageView = UIImageView(image: image) // Преобразует в UIImageView
        return imageView
    }
    
    // Задает высоту для каждого ряда чтобы поместилась картинка
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 64
    }
}
