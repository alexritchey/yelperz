//
//  SortTableViewCell.swift
//  Yelperz
//
//  Created by Alex Ritchey on 9/23/17.
//  Copyright © 2017 Alex Ritchey. All rights reserved.
//

import UIKit

@objc protocol DistanceCellDelegate {
    @objc optional func distanceCell(distanceCell: DistanceTableViewCell, updateSelectedDistance value: Int)
}

class DistanceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var selectedLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    class var expandedHeight: CGFloat { get { return 200 } }
    class var defaultHeight: CGFloat { get { return 50 } }
    
    let distanceList = [
        ["label": "Auto", "value": 10000],
        ["label": "10 miles", "value": 17000],
        ["label": "20 miles", "value": 40000]
    ]
    
    weak var delegate: DistanceCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pickerView.delegate = self
    }
    
    func dismissPicker() {
        pickerView.endEditing(true)
    }
    
    func checkHeight() {
        pickerView.isHidden = (frame.size.height < DistanceTableViewCell.expandedHeight)
    }
    
    func watchFrameChanges() {
        addObserver(self, forKeyPath: "distanceFrame", options: .new, context: nil)
        checkHeight()
    }
    
    func ignoreFrameChanges() {
        removeObserver(self, forKeyPath: "distanceFrame")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "distanceFrame" {
            checkHeight()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

extension DistanceTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return distanceList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Should update Sort Cell selectedLabel
        selectedLabel.text = distanceList[row]["label"] as? String
        delegate?.distanceCell?(distanceCell: self, updateSelectedDistance: distanceList[row]["value"] as! Int)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return distanceList[row]["label"] as? String
    }
}

