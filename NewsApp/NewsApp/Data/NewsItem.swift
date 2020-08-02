//
//  NewsItem.swift
//  NewsApp
//
//  Created by Artsiom Sakratar on 7/29/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

class NewsItem: NSObject, Codable {
    var title: String? = ""
    var author: String? = ""
    var urlToImage: String? = ""
    var publishedAt: String? = ""
    var _description: String? = ""
    var content: String? = ""
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case author = "author"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case _description = "description"
        case content = "content"
    }
}
