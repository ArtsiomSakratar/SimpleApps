//
//  NewsListVC.swift
//  NewsApp
//
//  Created by Artsiom Sakratar on 7/29/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class NewsListVC: UIViewController {
    private lazy var presenter: INewsListPresenter? = {
        return NewsListPresenter.setup(view: self)
    }()

    @IBOutlet weak var newsList: UITableView!
    
    private var adapter: NewsListAdapter? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsList?.register(UINib(nibName: NewsListViewCell.cellId, bundle: nil), forCellReuseIdentifier: NewsListViewCell.cellId)
        self.presenter?.getNews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "News list"
        self.newsList?.delegate = self.adapter
        self.newsList?.dataSource = self.adapter
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.newsList?.delegate = nil
        self.newsList?.dataSource = nil
        super.viewWillDisappear(animated)
    }
    
}

extension NewsListVC : INewsListView {
    func setupData(data: [NewsItem]) {
        if adapter == nil {
            self.adapter = NewsListAdapter()
        }
        
        self.adapter?.setupData(data: data)
        self.newsList?.delegate = self.adapter
        self.newsList?.dataSource = self.adapter
        
        self.newsList?.reloadData()
    }
}
