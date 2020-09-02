//
//  NetworkConfig.swift
//  MoviesDB
//
//  Created by Artsiom Sakratar on 9/1/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

class NetworkConfig: NSObject {
    static let shared = NetworkConfig()
    
    let baseUrl = "http://api.themoviedb.org/3/"
    let imageUrl = "http://image.tmdb.org/t/p/w300"
    
    let apiKey = "7ddf8d0e20c6928830acd5519d002bb5"
}
