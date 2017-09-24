//
//  SortTableViewCell.swift
//  Yelperz
//
//  Created by Alex Ritchey on 9/23/17.
//  Copyright © 2017 Alex Ritchey. All rights reserved.
//

import UIKit

class SortTableViewCell: UITableViewCell {

    @IBOutlet weak var sortLabel: UILabel!
    @IBOutlet weak var selectedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
