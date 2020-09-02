//
//  MoviesItemVC.swift
//  MoviesDB
//
//  Created by Artsiom Sakratar on 9/2/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit
import Kingfisher

class MoviesItemVC: UIViewController {
    private lazy var presenter: IMoviesItemPresenter? = {
        return MoviesItemPresenter.setup(view: self)
    }()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLable: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.setupContent()
    }
    
}

extension MoviesItemVC : IMoviesItemView {
    func input(data: Any?) {
        if let item = data as? MoviesItem {
            self.presenter?.setup(item: item)
        }
    }
    
    func setup(item: MoviesItem) {
        if let url = URL(string: item.posterPath.imageUrl) {
            self.imageView.kf.setImage(with: url)
        }
        self.titleLabel.text = item.title
        self.textLable.text = item.overview
    }
}
