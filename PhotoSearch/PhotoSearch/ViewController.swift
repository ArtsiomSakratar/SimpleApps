//
//  ViewController.swift
//  PhotoSearch
//
//  Created by Artsiom Sakratar on 2/15/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        searchImage(text: "panda")
        textField.becomeFirstResponder()
        imageView.layer.masksToBounds = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func convert(farm: Int, server: String, id: String, secret: String) -> URL? {
        let url = URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_c.jpg")
        return url
    }
    
    func showLoader(show: Bool) {
        DispatchQueue.main.async {
            if show {
                self.imageView.image = nil
                self.loader.startAnimating()
            } else {
                self.loader.stopAnimating()
            }
        }
    }
    
    func showError(text: String) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(ok)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
    func searchImage(text: String) {
        showLoader(show: true)
        
        let base = "https://www.flickr.com/services/rest/?method=flickr.photos.search"
        let key = "&api_key=b7f9222d2691a3e3288e799750bbe7d5"
        
        let formattedText = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        
        let textToSearch = "&text=\(formattedText)"
        let format = "&format=json&nojsoncallback=1"
        let sort = "&sort=relevance"
        
        let searchUrl = base + key + textToSearch  + format + sort
        
        let url = URL(string: searchUrl)!
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let jsonData = data else {
                self.showError(text: "Error: Missing data")
                self.showLoader(show: false)
                return
            }
            
            guard let jsonAny  = try? JSONSerialization.jsonObject(with: jsonData, options: []) else {
                self.showError(text: "Error: Missing json")
                self.showLoader(show: false)
                return
            }
            
            guard let json = jsonAny as? [String: Any] else {
                self.showLoader(show: false)
                return
            }
            
            guard let photos = json["photos"] as? [String: Any] else {
                self.showLoader(show: false)
                return
            }
            
            guard let photosArray = photos["photo"] as? [Any] else {
                self.showLoader(show: false)
                return
            }
            
            guard photosArray.count > 0 else {
                self.showError(text: "Error: No photo")
                self.showLoader(show: false)
                return
            }
            
            guard let firstPhoto = photosArray[0] as? [String: Any] else {
                self.showLoader(show: false)
                return
            }
            
            let farm = firstPhoto["farm"] as! Int
            let id = firstPhoto["id"] as! String
            let secret = firstPhoto["secret"] as! String
            let server = firstPhoto["server"] as! String
            
            let pictureUrl = self.convert(farm: farm, server: server, id: id, secret: secret)
            
            URLSession.shared.dataTask(with: pictureUrl!, completionHandler: { (data, _, _) in
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data!)
                }
                self.showLoader(show: false)
            }).resume()
            
        }.resume()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        searchImage(text: textField.text!)
        self.view.endEditing(true)
        
        return true
    }
}
