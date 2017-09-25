//
//  DealsTableViewCell.swift
//  Yelperz
//
//  Created by Alex Ritchey on 9/24/17.
//  Copyright © 2017 Alex Ritchey. All rights reserved.
//

import UIKit

@objc protocol DealsCellDelegate {
    @objc optional func dealsCell(dealsCell: DealsTableViewCell, didChangeValue value: Bool)
}

class DealsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dealsLabel: UILabel!
    @IBOutlet weak var dealsSwitch: UISwitch!
    
    weak var delegate: DealsCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dealsSwitch.addTarget(self, action: #selector(DealsTableViewCell.onValueChanged), for: UIControlEvents.valueChanged)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func onValueChanged() {
        delegate?.dealsCell?(dealsCell: self, didChangeValue: dealsSwitch.isOn)
    }

}
