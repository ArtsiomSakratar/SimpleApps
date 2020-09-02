//
//  ISearchListPresenter.swift
//  MoviesDB
//
//  Created by Artsiom Sakratar on 9/1/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

protocol ISearchListPresenter : class {
    var view: ISearchListView? {get set}
    
    func search(query: String)
    
    func select(index: Int)
}
