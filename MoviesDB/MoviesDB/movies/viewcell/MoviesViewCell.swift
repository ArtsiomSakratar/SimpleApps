//
//  MoviesViewCell.swift
//  MoviesDB
//
//  Created by Artsiom Sakratar on 9/1/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit
import Kingfisher

class MoviesViewCell: UITableViewCell {
        
    @IBOutlet weak var moviesImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moviesTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupItem(item: MoviesItem) {
        self.titleLabel.text = item.title
        self.moviesTextLabel.text = item.overview
        
        if let url = URL(string: item.posterPath.imageUrl) {
            self.moviesImage?.kf.setImage(with: url)
        } else {
            self.moviesImage?.image = nil
        }
    }
    
}
