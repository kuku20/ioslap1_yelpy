//
//  RestaurantCell.swift
//  Yelpy
//
//  Created by Luu, Loc on 9/11/21.
//  Copyright © 2021 memo. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {

    @IBOutlet weak var lable: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var ratingbar: UILabel!
    
    
    @IBOutlet weak var reviewcount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
