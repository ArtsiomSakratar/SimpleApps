//
//  MoviesList.swift
//  MoviesDB
//
//  Created by Artsiom Sakratar on 9/1/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

struct MoviesList: Codable {
    var results: [MoviesItem] = [MoviesItem]()
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}
