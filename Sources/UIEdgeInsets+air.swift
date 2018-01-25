//
//  UIEdgeInsets+air.swift
//  airUtilities
//
//  Created by Steven Thompson on 2018-01-22.
//  Copyright © 2018 airg. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    /// Creates new `UIEdgeInsets` with the same inset value on all sides
    ///
    /// - Parameter all: Inset to apply to all sides
    public init(all: CGFloat) {
        self = UIEdgeInsets(top: all, left: all, bottom: all, right: all)
    }
    
    /// Creates new `UIEdgeInsets` with the same inset value horizontally: left/right, and vertically: top/bottom
    ///
    /// - Parameter vertical: Inset to apply to top and bottom
    /// - Parameter horizontal: Inset to apply to left and right
    public init(vertical: CGFloat = 0, horizontal: CGFloat = 0) {
        self = UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
}
