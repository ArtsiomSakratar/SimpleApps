//
//  NewsListViewCell.swift
//  NewsApp
//
//  Created by Artsiom Sakratar on 8/2/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit
import Kingfisher

class NewsListViewCell: UITableViewCell {
    static let cellId = String(describing: NewsListViewCell.self)

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var dataLable: UILabel!
    @IBOutlet weak var contentLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupItem(item: NewsItem) {
        self.titleLable.text = item.title ?? ""
        self.contentLable.text = item.description ?? ""
        self.dataLable.text = item.publishedAt ?? ""
        
        if let imageUrl = item.urlToImage, let url = URL(string: imageUrl) {
            self.newsImageView?.kf.setImage(with: url)
        } else {
            self.newsImageView?.image = nil
        }
    }
}
