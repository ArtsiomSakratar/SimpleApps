//
//  IMoviesItemView.swift
//  MoviesDB
//
//  Created by Artsiom Sakratar on 9/2/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

protocol IMoviesItemView: class {
    func input(data: Any?)
    
    func setup(item: MoviesItem)
}
