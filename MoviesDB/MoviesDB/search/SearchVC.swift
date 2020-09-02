//
//  SearchVC.swift
//  MoviesDB
//
//  Created by Artsiom Sakratar on 9/1/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    private lazy var presenter: ISearchListPresenter? = {
        return SearchListPresenter.setup(view: self)
    }()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchList: UITableView!
    
    private var timer: Timer? = nil
    
    private var adapter: MoviesAdapter? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchList?.register(UINib(nibName: "MoviesViewCell", bundle: nil), forCellReuseIdentifier: "MoviesViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.largeTitleDisplayMode = .never
        self.title = "Search"
        self.searchList?.delegate = self.adapter
        self.searchList?.dataSource = self.adapter
        self.adapter?.owner = self
        self.searchBar.delegate = self
        self.searchBar.setShowsCancelButton(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.adapter?.owner = nil
        self.searchBar.delegate = nil
        self.searchList?.delegate = nil
        self.searchList?.dataSource = nil
        super.viewWillDisappear(animated)
    }
    
}

extension SearchVC : ISearchListView {
    
    func setupMovies(movies: [MoviesItem]) {
        if self.adapter == nil {
            self.adapter = MoviesAdapter()
        }
        self.adapter?.updateItems(items: movies)
        self.adapter?.owner = self
        self.searchList?.delegate = self.adapter
        self.searchList?.dataSource = self.adapter
        
        self.searchList?.reloadData()
    }
    
    func openItem(movie: MoviesItem) {
        let vc = MoviesItemVC()
        vc.input(data: movie)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SearchVC : TableOwner {
    func select(index: Int) {
        self.presenter?.select(index: index)
    }
}

extension SearchVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        timer = .scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] timer in
            guard let self = self else {return}
            
            self.presenter?.search(query: searchText)
        })
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.text = ""
        self.searchBar.resignFirstResponder()
    }
}
