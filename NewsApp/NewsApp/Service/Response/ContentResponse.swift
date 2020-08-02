//
//  ContentResponse.swift
//  NewsApp
//
//  Created by Artsiom Sakratar on 7/31/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

enum ErrorType {
    case other, network, service
}

class ContentResponse<T: Codable>: NSObject {
    var content: T?
    var error: ErrorResponse? = nil
    var code: Int = 0
    
    override init() {
        super.init()
    }
    
    convenience init(response: HTTPURLResponse?, data: Data) {
        self.init()
        code = response?.statusCode ?? 0
        
        let jsonDecoder = JSONDecoder()
        do {
            let result = try jsonDecoder.decode(T.self, from: data)
            content = result
            
            print(content)
        } catch {
            print("\(error)")
        }
        
        do {
            self.error = try jsonDecoder.decode(ErrorResponse.self, from: data)
                        
            print(content)
        } catch {
            print("\(error)")
        }
    }
    
    convenience init(error: ErrorResponse) {
        self.init()
        self.error = error
    }
}

class ErrorResponse: NSObject, Codable {
    var code: String? = ""
    var status: String? = ""
    var message: String? = ""
    var type: ErrorType = .other
    
    override init() {
        super.init()
    }
    
    convenience init(type: ErrorType) {
        self.init()
        self.type = type
    }
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case status = "status"
        case message = "message"
    }
}
