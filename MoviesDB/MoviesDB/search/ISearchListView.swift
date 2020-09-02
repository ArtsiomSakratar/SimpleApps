//
//  ISearchListView.swift
//  MoviesDB
//
//  Created by Artsiom Sakratar on 9/2/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

protocol ISearchListView : class {
    func setupMovies(movies: [MoviesItem])
    
    func openItem(movie: MoviesItem)
}
