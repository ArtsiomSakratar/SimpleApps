import UIKit
import Foundation

let apiKey = "ab26dc47d810fc8dee291361c647e908"

let data: Data? = """
{"coord":{"lon":-121.88,"lat":38.03},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"base":"stations","main":{"temp":291.56,"feels_like":287.2,"temp_min":290.93,"temp_max":292.59,"pressure":1012,"humidity":52},"visibility":10000,"wind":{"speed":5.7,"deg":200},"clouds":{"all":1},"dt":1595918945,"sys":{"type":1,"id":3581,"country":"US","sunrise":1595855199,"sunset":1595906469},"timezone":-25200,"id":5383465,"name":"Pittsburg","cod":200}
""".data(using: .utf8)

struct Weather: Codable {
    var temp: Double?
    var humidity: Double?
}

struct WeatherMain: Codable {
    let main: Weather
}

func decodeJSONData(JSONData: Data) {
    do {
        let weatherData = try? JSONDecoder().decode(WeatherMain.self, from: JSONData)
        if let weatherData = weatherData {
            let weather = weatherData.main
            print(weather.temp!)
            print(weather.humidity!)
        }
    }
}

struct WeatherData: Decodable {
    let list: [List]
}

struct Main: Decodable {
    let temp: Float
    let temp_max: Float
    let temp_min: Float
    let feels_like: Float
    let humidity: Float
}

struct Weather2: Decodable {
    let main: String
    let description: String
    let icon: String
}

struct List: Decodable {
    let main: Main
    let weather: [Weather2]
}

func decodeJSONForecast(JSONData: Data) {
    let response = try! JSONDecoder().decode(WeatherData.self, from: JSONData)
    
    for i in response.list {
        print("Temp : \(i.main.temp)")
        print("Temp Max: \(i.main.temp_max)")
        print("Temp Min: \(i.main.temp_min)")
        print("Feels Like : \(i.main.feels_like)")
        print("Humidity : \(i.main.humidity)")
        for j in i.weather {
            print("\nMain : \(j.main)")
            print("Description : \(j.description)")
            print("Icon : \(j.icon)")
        }
    }
}

func pullJSONData(url: URL?, forecast: Bool) {
    let task = URLSession.shared.dataTask(with: url!) { data, response, error in
        if let error = error {
            print("Error : \(error.localizedDescription)")
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200
            else {
                print("Error : HTTP Response Code Error")
                return
        }
        
        guard let data = data else {
            print("Error : No Response")
            return
        }
        
        if(!forecast) {
            decodeJSONData(JSONData: data)
        } else {
            decodeJSONForecast(JSONData: data)
        }
    }
    task.resume()
}

let city: String = "Pittsburg"
let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)")

pullJSONData(url: url, forecast: false)

let url2 = URL(string: "http://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(apiKey)")

pullJSONData(url: url2, forecast: true)

