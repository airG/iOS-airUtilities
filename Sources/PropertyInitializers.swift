//
//  UIView+Styling.swift
//  airUtilities
//
//  Created by Steven Thompson on 2018-01-22.
//  Copyright © 2018 airg. All rights reserved.
//

import Foundation

public extension UIView {
    public convenience init(style: ((UIView) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}

public extension UICollectionView {
    public convenience init(style: ((UICollectionView) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}

public extension UIImageView {
    public convenience init(style: ((UIImageView) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}

public extension UILabel {
    public convenience init(style: ((UILabel) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}

public extension UIStackView {
    public convenience init(style: ((UIStackView) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}

public extension UIBarButtonItem {
    public convenience init(style: ((UIBarButtonItem) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}

public extension UIButton {
    public convenience init(style: ((UIButton) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}

public extension UITextView {
    public convenience init(style: ((UITextView) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}

public extension UITextField {
    public convenience init(style: ((UITextField) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}
