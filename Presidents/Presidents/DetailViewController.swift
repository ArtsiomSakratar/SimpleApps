//
//  DetailViewController.swift
//  Presidents
//
//  Created by Artsiom Sakratar on 7/4/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel! // Выход для лейбла ссылки
    @IBOutlet weak var webView: UIWebView! // Выход для этображения веб страницы
    
    private var languageListController: LanguageListController? // Объект списка языков
    private var languageButton: UIBarButtonItem? // Кнопка выбора языка
    var languageString = "" { // Язык
        didSet { // При изменении
            if languageString != oldValue { // Если новое значение не равно старому
                configureView() // Обновляет отображение контроллера
            }
        }
    }
    var detailItem: AnyObject? { // Хранит данные для текущего вью
           didSet { // При изменении
               configureView() // Обновление отображения
           }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView() // Отображение вью
        languageButton = UIBarButtonItem(title: "Choose Language", style: .plain, target: self, action: #selector(DetailViewController.showLanguagePopover)) // Настройка кнопки выбора языка
        navigationItem.rightBarButtonItem = languageButton // Устанавливаетя кнопка выбора языка
    }

    // Отображение содержимого контроллера
    func configureView() {
        // Если сущетвуют данные для отображения
        if let detail = detailItem {
            if let label = detailDescriptionLabel { // Если лэйбл не нил
                let dict = detail as! [String: String] // Преобразует данные в словарь
                let urlString = modifyUrlForLanguage(url: dict["url"]!, language: languageString) // Получает сформированные url для отображения
                label.text = urlString // Изменяет текст лейбла на url
                
                let url = NSURL(string: urlString)! // Создается объект url на основе строки
                let request = URLRequest(url: url as URL) // Создается запрос на основе url
                webView.loadRequest(request) // Осуществляет отображение веб страницы на основе запроса
                let name = dict["name"]! // Получает название президента
                title = name // Изменяет заголовок вью
            }
        }
    }
    
    // Осуществляет отображение выбора языка
    @objc func showLanguagePopover() {
        if languageListController == nil { // Если список для отображения не существует
            languageListController = LanguageListController() // Создается объект отображения списка языков
            languageListController!.detailViewController = self // Становится делегатом
            languageListController!.modalPresentationStyle = .popover // Задается стиль показы меню
        }
        present(languageListController!, animated: true, completion: nil) // Осуществляет перехож
        if let ppc = languageListController?.popoverPresentationController { // Получает объект который можно привязать к месту отображения меню
            ppc.barButtonItem = languageButton // Задает место отображения меню возде кнопки языка
        }
    }

    // Формирование url
    private func modifyUrlForLanguage(url: String, language lang: String?) -> String {
        var newUrl = url // Сохраняет значение url
        
        // Разворачивает lang
        if let langStr = lang {
            let range = NSMakeRange(8, 2) // Позиция для замены в строке
            
            // Если значение языка не пустое и значение языка в строке не совбадают с пришедшим значение языка
            if !langStr.isEmpty && (url as NSString).substring(with: range) != langStr {
                newUrl = (url as NSString).replacingCharacters(in: range, with: langStr) // Формирует строку на основе новых данных
            }
        }
        
        return newUrl // Возвращает сформированный url
    }

}

