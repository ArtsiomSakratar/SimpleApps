//
//  MoviesListPresenter.swift
//  MoviesDB
//
//  Created by Artsiom Sakratar on 9/1/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

class MoviesListPresenter : NSObject, IMoviesListPresenter {
    weak var service = MoviesService.shared
    weak var view: IMoviesListView?
    
    private var items: [MoviesItem] = [MoviesItem]()
    
    static func setup(view: IMoviesListView) -> IMoviesListPresenter {
        let presenter = MoviesListPresenter()
        presenter.view = view
        return presenter
    }
    
    func loadData() {
        self.service?.getMovies(completion: { [weak self] (result: Result<MoviesList, Error>) in
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

