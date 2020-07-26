//
//  ViewController.swift
//  WeatherApp
//
//  Created by Artsiom Sakratar on 2/13/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
    }
}

extension ViewController: UISearchBarDelegate {
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        let urlString = "http://api.weatherstack.com/current?access_key=1d6d86e5c5317169817e81ef5049fba2&query=\(searchBar.text!.replacingOccurrences(of: " ", with: "%20"))"
        let url = URL.init(string: urlString)
        
        var locationName: String?
        var temperature: Double?
        var errorHasOccured: Bool = false
        
        let task = URLSession.shared.dataTask(with: url!) {[weak self] (data, responce, error) in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                
                if let _ = json["error"] {
                    errorHasOccured = true
                }
                
                if let location = json["location"] {
                    locationName = location["name"] as? String
                }
                
                if let current = json["current"] {
                    temperature = current["temperature"] as? Double
                }
                
                DispatchQueue.main.async {
                    if errorHasOccured {
                        self?.cityLabel.text = "Error has occured"
                        
                        self?.temperatureLabel.isHidden = true
                    } else {
                        self?.cityLabel.text = locationName
                        self?.temperatureLabel.text = "\(temperature!)"
                        
                        self?.temperatureLabel.isHidden = false
                    }
                }
            }
            catch let jsonError {
                print(jsonError)
            }
        }
        
        task.resume()
    }
}
