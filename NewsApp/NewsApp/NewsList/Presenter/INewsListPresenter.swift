//
//  INewsListPresenter.swift
//  NewsApp
//
//  Created by Artsiom Sakratar on 7/29/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

protocol INewsListPresenter : class {
    var view: INewsListView? {get set}
    
    func getNews()
}
