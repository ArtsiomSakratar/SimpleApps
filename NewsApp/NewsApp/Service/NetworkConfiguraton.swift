//
//  NetworkConfiguraton.swift
//  NewsApp
//
//  Created by Artsiom Sakratar on 7/30/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

class NetworkConfiguration: NSObject, INetworkConfiguration {
    private let apiKey = "54efeebecbc94bd1b20285e562b68291"
    private let url = "http://newsapi.org/v2/"
    
    func getHeaders() -> [String : String] {
        return ["X-Api-Key" : apiKey]
    }
    
    func getBaseURL() -> String {
        return url
    }
}
