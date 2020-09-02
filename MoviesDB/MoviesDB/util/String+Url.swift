//
//  String+Url.swift
//  MoviesDB
//
//  Created by Artsiom Sakratar on 9/2/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

extension String {
    var imageUrl: String {
        let baseImage = NetworkConfig.shared.imageUrl
        return "\(baseImage)\(self)"
    }
}
