//
//  News.swift
//  NewsApp
//
//  Created by Artsiom Sakratar on 7/31/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

class NewsService : NSObject {
    let networkService = NetworkService()
    
    func getNews(completion: @escaping(ContentResponse<NewsList>)->Void) {
        self.networkService.request(url: "top-headlines?language=en", parameters: [:], method: .get) { (result: ContentResponse<NewsList>) in
            completion(result)
        }
    }
}
