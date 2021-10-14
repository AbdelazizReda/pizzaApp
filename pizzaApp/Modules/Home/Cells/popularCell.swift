//
//  popularCell.swift
//  pizzaApp
//
//  Created by عبدالعزيز رضا  on 3/31/21.
//  Copyright © 2021 abdelazizReda. All rights reserved.
//

import UIKit

class popularCell: UITableViewCell {

    @IBOutlet weak var ratingView: RatingView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
