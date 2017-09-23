//
//  FilterTableViewCell.swift
//  Yelperz
//
//  Created by Alex Ritchey on 9/23/17.
//  Copyright © 2017 Alex Ritchey. All rights reserved.
//

import UIKit

@objc protocol FilterCellDelegate {
    @objc optional func filterCell(filterCell: FilterTableViewCell, didChangeValue value: Bool)
}

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var categorySwitch: UISwitch!
    @IBOutlet weak var categoryLabel: UILabel!
    
    weak var delegate: FilterCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        categorySwitch.addTarget(self, action: #selector(FilterTableViewCell.onValueChanged), for: UIControlEvents.valueChanged)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func onValueChanged() {
        delegate?.filterCell?(filterCell: self, didChangeValue: categorySwitch.isOn)
    }

}
