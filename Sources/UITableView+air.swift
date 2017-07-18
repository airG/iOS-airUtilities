//
//  UITableView+air.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import UIKit

public extension UITableView {
    // MARK:- UITableViewCell

    /// Registers `type.Nib` for `type.Identifier`
    ///
    /// - Parameter type: `UITableViewCell` subclass to register
    public func registerNib<T: UITableViewCell>(of type: T.Type) {
        self.register(T.Nib, forCellReuseIdentifier: T.Identifier)
    }

    /// Registers `type` for `type.Identifier`
    ///
    /// - Parameter type: `UITableViewCell` subclass to register
    public func registerClass<T: UITableViewCell>(of type: T.Type) {
        self.register(type, forCellReuseIdentifier: T.Identifier)
    }

    /// Dequeues a cell of type `T` for reuseIdentifier `T.Identifier`
    ///
    /// - Parameter indexPath: indexPath of cell
    /// - Returns: Your registered `UITableViewCell` subclass
    public func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.Identifier, for: indexPath) as! T
    }

    // MARK: - UITableViewHeaderFooterView

    /// Registers `type.Nib` for `type.Identifier`
    ///
    /// - Parameter type: `UITableViewHeaderFooterView` subclass to register
    public func registerNib<T: UITableViewHeaderFooterView>(of type: T.Type) {
        self.register(T.Nib, forHeaderFooterViewReuseIdentifier: T.Identifier)
    }

    /// Registers `type` for `type.Identifier`
    ///
    /// - Parameter type: `UITableViewHeaderFooterView` subclass to register
    public func registerClass<T: UITableViewHeaderFooterView>(of type: T.Type) {
        self.register(type, forHeaderFooterViewReuseIdentifier: T.Identifier)
    }

    /// Dequeues a headerFooterView of type `T` for reuseIdentifier `T.Identifier`
    ///
    /// - Parameter indexPath: indexPath of headerFooterView
    /// - Returns: Your registered `UITableViewHeaderFooterView` subclass
    public func dequeueHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: T.Identifier) as! T
    }
}
