//
//  IMoviesListPresenter.swift
//  MoviesDB
//
//  Created by Artsiom Sakratar on 9/1/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

protocol IMoviesListPresenter : class {
    var view: IMoviesListView? {get set}
    
    func loadData()
    
    func select(index: Int)
}
