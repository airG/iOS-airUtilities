//
//  UITextView+air.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import UIKit

public extension UITextField {
    /// Returns value of `self.text.isEmpty`
    public var isTextEmpty: Bool {
        guard let text = self.text else {
            return true
        }

        return text.isEmpty
    }
}
