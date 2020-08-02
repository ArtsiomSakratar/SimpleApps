//
//  NewsListPresenter.swift
//  NewsApp
//
//  Created by Artsiom Sakratar on 7/29/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

class NewsListPresenter: NSObject, INewsListPresenter {
    weak var view: INewsListView?
    let service = NewsService()
    
    var articles: [NewsItem] = [NewsItem]()
    
    static func setup(view: INewsListView) -> INewsListPresenter {
        let presenter = NewsListPresenter()
        presenter.view = view
        return presenter
    }
    
    func getNews() {
        self.service.getNews { [weak self] (result: ContentResponse<NewsList>) in
            guard let self = self else {return}
            
            if let data = result.content?.articles {
                self.articles = [NewsItem]()
                self.articles.append(contentsOf: data)
                
                self.view?.setupData(data: self.articles)
            }
        }
    }
}
