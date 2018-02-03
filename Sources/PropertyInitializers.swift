//
//  UIView+Styling.swift
//  airUtilities
//
//  Created by Steven Thompson on 2018-01-22.
//  Copyright © 2018 airg. All rights reserved.
//

import Foundation

public extension UIView {
    /// Initialize a UIView with the provided style properties as { $0.textColor = ... }
    ///
    /// - Parameter style: Variadic list of properties to apply to the UIView
    public convenience init(style: ((UIView) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}

public extension UICollectionView {
    /// Initialize a UICollectionView with the provided style properties as { $0.textColor = ... }
    ///
    /// - Parameter style: Variadic list of properties to apply to the UICollectionView
    public convenience init(style: ((UICollectionView) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}

public extension UIImageView {
    /// Initialize a UIImageView with the provided style properties as { $0.textColor = ... }
    ///
    /// - Parameter style: Variadic list of properties to apply to the UIImageView
    public convenience init(style: ((UIImageView) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}

public extension UILabel {
    /// Initialize a UILabel with the provided style properties as { $0.textColor = ... }
    ///
    /// - Parameter style: Variadic list of properties to apply to the UILabel
    public convenience init(style: ((UILabel) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}

public extension UIStackView {
    /// Initialize a UIStackView with the provided style properties as { $0.textColor = ... }
    ///
    /// - Parameter style: Variadic list of properties to apply to the UIStackView
    public convenience init(style: ((UIStackView) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}

public extension UIBarButtonItem {
    /// Initialize a UIBarButtonItem with the provided style properties as { $0.textColor = ... }
    ///
    /// - Parameter style: Variadic list of properties to apply to the UIBarButtonItem
    public convenience init(style: ((UIBarButtonItem) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}

public extension UIButton {
    /// Initialize a UIButton with the provided style properties as { $0.textColor = ... }
    ///
    /// - Parameter style: Variadic list of properties to apply to the UIButton
    public convenience init(style: ((UIButton) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}

public extension UITextView {
    /// Initialize a UITextView with the provided style properties as { $0.textColor = ... }
    ///
    /// - Parameter style: Variadic list of properties to apply to the UITextView
    public convenience init(style: ((UITextView) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}

public extension UITextField {
    /// Initialize a UITextField with the provided style properties as { $0.textColor = ... }
    ///
    /// - Parameter style: Variadic list of properties to apply to the UITextField
    public convenience init(style: ((UITextField) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}
