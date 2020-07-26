//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Artsiom Sakratar on 3/1/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    // MARK: - Proporties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
