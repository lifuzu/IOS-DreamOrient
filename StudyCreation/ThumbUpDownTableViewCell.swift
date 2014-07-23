//
//  ThumbUpDownTableViewCell.swift
//  StudyCreation
//
//  Created by Richard Lee on 7/17/14.
//  Copyright (c) 2014 weimed. All rights reserved.
//

import UIKit

class ThumbUpDownTableViewCell: UITableViewCell {

    @IBOutlet var updownStepper : UIStepper = nil
    @IBOutlet var textDisplay : UILabel = nil
    
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
    }

    @IBAction func stepperValueDidChanged(sender : UIStepper) {
        //var cell = sender.superview.superview.superview
        textDisplay.text = String(Int(sender.value))
        //println(cell.description)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
