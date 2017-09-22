//
//  YelpTableViewCell.swift
//  Yelperz
//
//  Created by Alex Ritchey on 9/21/17.
//  Copyright © 2017 Alex Ritchey. All rights reserved.
//

import UIKit

class YelpTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var reviews: UILabel!
    @IBOutlet weak var categories: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var ratingImage: UIImageView!

    var business: Business! {
        didSet {
            name.text = business.name
            thumbnail.setImageWith(business.imageURL!)
            categories.text = business.categories
            address.text = business.address
            reviews.text = "\(business.reviewCount?.description ?? "0") Reviews"
            distance.text = business.distance
            ratingImage.setImageWith(business.ratingImageURL!)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        name.preferredMaxLayoutWidth = name.frame.size.width
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        name.preferredMaxLayoutWidth = name.frame.size.width
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
