//
//  MoviesItem.swift
//  MoviesDB
//
//  Created by Artsiom Sakratar on 9/1/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

struct MoviesItem : Codable {
    var id: Int = 0
    var title: String = ""
    var overview: String = ""
    var posterPath: String = ""
    var releaseDate: Date = Date()
    
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//    }
}
