//
//  UILabel+air.swift
//  airUtilities
//
//  Created by Steven Thompson on 2018-01-17.
//  Copyright © 2018 airg. All rights reserved.
//

import Foundation

public extension UILabel {
    /// Returns value of `self.text.isEmpty`
    public var isTextEmpty: Bool {
        guard let text = self.text else {
            return true
        }

        return text.isEmpty
    }
}
