//
//  SwitchTableViewCell.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-06-01.
//  Copyright © 2017 airg. All rights reserved.
//

import UIKit

/// <#Description#>
class SwitchTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var `switch`: UISwitch!

    /// Called when the switch toggles, with `switch.isOn`
    var valueChanged: ((Bool) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()

        titleLabel.respondsToDynamicTypeChanges = true
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if let valueChanged = valueChanged {
            valueChanged(sender.isOn)
        }
    }
}
