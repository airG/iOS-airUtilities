//
//  UIView+air.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import UIKit

// MARK: - Easy access to Nib and Identifier, provided you always name Identifier the same as class
public extension UIView {
    /// Gets the `UINib` named `self.Identifier`
    public static var Nib: UINib {
        let bundle = Bundle(for: self)
        return UINib(nibName: Identifier, bundle: bundle)
    }
    
    /// The string representation of `self`
    public static var Identifier: String {
        return String(describing: self)
    }
}

public extension UIView {
    /// Applies a rounded mask and matching border to a view
    ///
    /// - Parameters:
    ///   - corners: Which corners to round
    ///   - radius: The corner radius to apply to `corners`
    ///   - borderColor: The color of the border
    public func round(corners: UIRectCorner, radius: Int, borderColor: UIColor? = nil) {
        let maskLayer = CAShapeLayer()
        let roundedPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        maskLayer.path = roundedPath.cgPath
        layer.mask = maskLayer

        if let borderColor = borderColor {
            let borderLayer = CAShapeLayer()
            borderLayer.path = roundedPath.cgPath
            borderLayer.strokeColor = borderColor.cgColor
            borderLayer.lineWidth = 1.0
            borderLayer.fillColor = UIColor.clear.cgColor
            layer.addSublayer(borderLayer)
        }
    }
}
