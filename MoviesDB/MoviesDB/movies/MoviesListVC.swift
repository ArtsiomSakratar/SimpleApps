//
//  MoviesListVC.swift
//  MoviesDB
//
//  Created by Artsiom Sakratar on 9/1/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class MoviesListVC: UIViewController {
    
    private lazy var presenter: IMoviesListPresenter? = {
        return MoviesListPresenter.setup(view: self)
    }()
    
    @IBOutlet weak var moviesList: UITableView!
    
    private var adapter: MoviesAdapter? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.moviesList?.register(UINib(nibName: "MoviesViewCell", bundle: nil), forCellReuseIdentifier: "MoviesViewCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.largeTitleDisplayMode = .never
        self.title = "Movies"
        self.moviesList?.delegate = self.adapter
        self.moviesList?.dataSource = self.adapter
        self.adapter?.owner = self
        self.presenter?.loadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.adapter?.owner = nil
        self.moviesList?.delegate = nil
        self.moviesList?.dataSource = nil
        super.viewWillDisappear(animated)
    }
}

extension MoviesListVC : IMoviesListView {
    func setupMovies(movies: [MoviesItem]) {
        if self.adapter == nil {
            self.adapter = MoviesAdapter()
        }
        self.adapter?.updateItems(items: movies)
        self.adapter?.owner = self
        self.moviesList?.delegate = self.adapter
        self.moviesList?.dataSource = self.adapter

        self.moviesList?.reloadData()
    }
}

extension MoviesListVC : TableOwner {
    func select(index: Int) {
        self.presenter?.select(index: index)
    }
    
    func openItem(movie: MoviesItem) {
        let vc = MoviesItemVC()
        vc.input(data: movie)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
