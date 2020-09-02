//
//  SearchListPresenter.swift
//  MoviesDB
//
//  Created by Artsiom Sakratar on 9/1/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

class SearchListPresenter : NSObject, ISearchListPresenter {
    weak var service = MoviesService.shared
    weak var view: ISearchListView?
    
    private var items: [MoviesItem] = [MoviesItem]()
    
    static func setup(view: ISearchListView) -> ISearchListPresenter {
        let presenter = SearchListPresenter()
        presenter.view = view
        return presenter
    }
    
    func search(query: String) {
        self.service?.search(query: query, completion: { [weak self] (result: Result<MoviesList, Error>) in
            guard let self = self else {return}
            
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
                self.items = [MoviesItem]()
                self.items.append(contentsOf: data.results)
                self.view?.setupMovies(movies: self.items)
            }
        })
    }
    
    func select(index: Int) {
        let item = self.items[index]
        self.view?.openItem(movie: item)
    }
}

