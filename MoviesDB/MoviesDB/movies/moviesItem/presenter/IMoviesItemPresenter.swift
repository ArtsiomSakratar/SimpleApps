//
//  IMoviesItemPresenter.swift
//  MoviesDB
//
//  Created by Artsiom Sakratar on 9/2/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

protocol IMoviesItemPresenter: class {
    var view: IMoviesItemView? {get set}
    
    func setup(item: MoviesItem)
    
    func setupContent()
}
