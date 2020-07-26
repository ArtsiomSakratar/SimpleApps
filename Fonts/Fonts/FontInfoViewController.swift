//
//  FontInfoViewController.swift
//  Fonts
//
//  Created by Artsiom Sakratar on 6/22/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class FontInfoViewController: UIViewController {
    
    var font: UIFont! // Хранит шрифт ячейки
    var favorite: Bool = false // Флаг для переключателя избранного
    @IBOutlet weak var fontSampleLabel: UILabel!
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var favoriteSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontSampleLabel.font = font // Устанавливает шрифт лейбла
        fontSampleLabel.text = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVv" + "WwXxYyZz 0123456789" // Устанавливает текст лейбла
        fontSizeSlider.value = Float(font.pointSize) // Задается начальное положение слайдера
        fontSizeLabel.text = "\(Int(font.pointSize))" // Задается значение лейбла который отображает текущее значение слайдера
        favoriteSwitch.isOn = favorite // Устанавливает положение переключателя
    }
    
    // Экшен слайдера
    @IBAction func sliderFontSize(slider: UISlider) {
        let newSize = roundf(slider.value) // Получает текущее значение слайдера
        fontSampleLabel.font = font.withSize(CGFloat(newSize)) // Изменяет размер шрифта в соответствии с значением слайдера
        fontSizeLabel.text = "\(Int(newSize))" // Изменяет значение лейбла слайдера
    }

    // Экшен переключателя
    @IBAction func toggleFavorite(sender: UISwitch) {
        let favoritesList = FavoritesList.sharedFavoritesList // Получает ссылку на массив избранных шрифтов
        if sender.isOn { // Если переключатель включен
            favoritesList.addFavorite(fontName: font.fontName) // Добавляет текущий шрифт в массив избранных шрифтов
        } else { // Если выключен
            favoritesList.removeFavorite(fontName: font.fontName) // Удаляет текущий шрифт в массив избранных шрифтов
        }
    }
    
}
