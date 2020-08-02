//
//  NewsListAdapter.swift
//  NewsApp
//
//  Created by Artsiom Sakratar on 8/2/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation
import UIKit

class NewsListAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private var items: [NewsItem] = [NewsItem]()
    
    override init() {
        super.init()
    }
    
    func setupData(data: [NewsItem]) {
        self.items = [NewsItem]()
        self.items.append(contentsOf: data)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsListViewCell.cellId, for: indexPath) as? NewsListViewCell else {
            return UITableViewCell()
        }
        
        let item = items[indexPath.row]
        cell.setupItem(item: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
}
