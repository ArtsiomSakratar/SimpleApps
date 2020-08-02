//
//  INetworkConfiguration.swift
//  NewsApp
//
//  Created by Artsiom Sakratar on 7/30/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

protocol INetworkConfiguration : class {
    func getHeaders() -> [String : String]
    
    func getBaseURL() -> String
}
