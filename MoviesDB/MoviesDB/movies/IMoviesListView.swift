//
//  IMoviesListView.swift
//  MoviesDB
//
//  Created by Artsiom Sakratar on 9/1/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

protocol IMoviesListView : class {
    func setupMovies(movies: [MoviesItem])
    
    func openItem(movie: MoviesItem)
}
