//
//  NewsList.swift
//  NewsApp
//
//  Created by Artsiom Sakratar on 7/29/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class NewsList: NSObject, Codable {
    var articles: [NewsItem] = [NewsItem]()
    
    enum CodingKeys: String, CodingKey {
        case articles = "articles"
    }
}
