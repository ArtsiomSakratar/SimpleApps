//
//  MoviesAdapter.swift
//  MoviesDB
//
//  Created by Artsiom Sakratar on 9/2/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation
import UIKit

class MoviesAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private var items: [MoviesItem] = [MoviesItem]()
    
    weak var owner: TableOwner? = nil
    
    func updateItems(items: [MoviesItem]) {
        self.items = [MoviesItem]()
        self.items.append(contentsOf: items)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesViewCell", for: indexPath) as? MoviesViewCell else {
            return UITableViewCell()
        }
        let item = self.items[indexPath.row]
        cell.setupItem(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.owner?.select(index: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

}
