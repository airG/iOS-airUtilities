//
//  Int+air.swift
//  airUtilities
//
//  Created by Steven Thompson on 2018-02-02.
//  Copyright © 2018 airg. All rights reserved.
//

import Foundation

extension Int {
    /// Turns a number like 1000000 into 1,000k
    var inThousands: String {
        let form = NumberFormatter()
        form.roundingIncrement = 1000
        form.numberStyle = .decimal
        form.locale = Locale(identifier: "en_US")
        
        var thousandsString: String = self < 0 ? "-" : ""
        
        let absoluteValue = abs(self)
        
        if absoluteValue >= 1000, let rounded = form.string(from: NSNumber(value: absoluteValue)) {
            let new = rounded.prefix(rounded.count - 4).appending("k")
            thousandsString.append(new)
        } else {
            thousandsString.append(String(absoluteValue))
        }
        
        return thousandsString
    }
}
