//
//  NetworkService.swift
//  NewsApp
//
//  Created by Artsiom Sakratar on 7/30/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

enum Methods {
    case get, post, patch, delete
    
    func toMethod() -> String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .patch:
            return "PATCH"
        case .delete:
            return "DELETE"
        }
    }
}

class NetworkService: NSObject, INetworkService {
    let config: INetworkConfiguration = NetworkConfiguration()
    
    var URLConfiguration = URLSessionConfiguration.default
    
    lazy var urlSession: URLSession? = {
        return URLSession(configuration: URLConfiguration)
    }()
    
    var dataTask: URLSessionDataTask? = nil
    
    func request<T>(url: String, parameters: [String : Any], method: Methods, comletion: @escaping(ContentResponse<T>) -> Void) where T: Codable {
        let apiUrl = "\(self.config.getBaseURL())\(url)"
        
        guard let urlPath = URL(string: apiUrl) else {
            return
        }
        
        var urlRequest = URLRequest(url: urlPath)
        urlRequest.httpMethod = method.toMethod()
        
        let headers = self.config.getHeaders()
        
        for key in headers.keys {
            urlRequest.addValue(headers[key] ?? "", forHTTPHeaderField: key)
        }
        
        self.dataTask = self.urlSession?.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            if let _ = error {
                let errorResult = ContentResponse<T>(error: ErrorResponse(type: .network))
                DispatchQueue.main.async {
                    comletion(errorResult)
                }
            } else {
                if let data = data, let response = response as? HTTPURLResponse {
                    let result = ContentResponse<T>(response: response, data: data)
                    DispatchQueue.main.async {
                        comletion(result)
                    }
                } else {
                    let errorResult = ContentResponse<T>(error: ErrorResponse(type: .network))
                    DispatchQueue.main.async {
                        comletion(errorResult)
                    }
                }
            }
        })
        
        self.dataTask?.resume()
    }
}
