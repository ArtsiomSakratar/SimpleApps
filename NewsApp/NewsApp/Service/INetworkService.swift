//
//  INetworkService.swift
//  NewsApp
//
//  Created by Artsiom Sakratar on 7/31/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

protocol INetworkService {
    func request<T>(url: String, parameters: [String : Any], method: Methods, comletion: @escaping(ContentResponse<T>) -> Void) where T: Codable
}
