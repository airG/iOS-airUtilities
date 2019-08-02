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

// MARK: - Layer
public extension UIView {
    /// Applies a rounded mask and matching border to a view
    ///
    /// - Parameters:
    ///   - corners: Which corners to round
    ///   - radius: The corner radius to apply to `corners`
    ///   - borderColor: The color of the border
    public func round(corners: UIRectCorner, radius: Int, borderColor: UIColor? = nil, borderWidth: CGFloat? = nil) {
        let maskLayer = CAShapeLayer()
        let roundedPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        maskLayer.path = roundedPath.cgPath
        layer.mask = maskLayer
        
        if let borderColor = borderColor,
            let borderWidth = borderWidth {
            let borderLayer = CAShapeLayer()
            borderLayer.path = roundedPath.cgPath
            borderLayer.strokeColor = borderColor.cgColor
            borderLayer.lineWidth = borderWidth
            borderLayer.fillColor = UIColor.clear.cgColor
            layer.addSublayer(borderLayer)
        }
    }
}

// MARK: - AutoLayout
@available(iOS, introduced: 9.0)
public extension UIView {
    /// Fill self with the provided view.
    ///
    /// - parameter view: View to pin to edges. Must already be in the view hierarchy.
    public func fill(with view: UIView) -> Void {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: [], metrics: nil, views: ["view": view]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: ["view": view]))
    }
    
    /// Constrain size of self to a specific width and height.
    ///
    /// - parameter width:
    /// - parameter height:
    public func constrainSize(width: CGFloat, height: CGFloat) {
        constrainWidth(to: width)
        constrainHeight(to: height)
    }
    
    /// Constrain height of self.
    ///
    /// - parameter height:
    public func constrainHeight(to height: CGFloat) {
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    /// Constrain width of self.
    ///
    /// - parameter width:
    public func constrainWidth(to width: CGFloat) {
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    /// Align centerX and centerY of `view` to `self`.
    ///
    /// - parameter view: View to constrain. Must already be in the view hierarchy
    public func center(on view: UIView) {
        addConstraint(NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        
        
    }
}
