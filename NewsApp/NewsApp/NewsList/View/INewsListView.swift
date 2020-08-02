//
//  INewsListView.swift
//  NewsApp
//
//  Created by Artsiom Sakratar on 7/29/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

protocol INewsListView: class {
    func setupData(data: [NewsItem])
}
