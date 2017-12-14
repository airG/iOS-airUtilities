//
//  CollectionView+air.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import Foundation

public extension UICollectionView {

    /// Registers `type.Nib` for `type.Identifier`
    ///
    /// - Parameter type: `UICollectionViewCell` subclass to register
    public func registerNib<T: UICollectionViewCell>(of type: T.Type) {
        self.register(T.Nib, forCellWithReuseIdentifier: T.Identifier)
    }

    /// Registers `type` for `type.Identifier`
    ///
    /// - Parameter type: `UICollectionViewCell` subclass to register
    public func registerClass<T: UICollectionViewCell>(of type: T.Type) {
        self.register(type, forCellWithReuseIdentifier: T.Identifier)
    }

    /// Dequeues a cell of type `T` for reuseIdentifier `T.Identifier`
    ///
    /// - Parameter indexPath: indexPath of cell
    /// - Returns: Your registered `UICollectionViewCell` subclass
    public func dequeueCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.Identifier, for: indexPath) as! T
    }

    // MARK: - UICollectionReusableView
    public typealias SupplementaryViewKind = String

    /// Registers `type.Nib` for `type.Identifier`
    ///
    /// - Parameter type: `UICollectionReusableView` subclass to register
    public func registerNib<T: UICollectionReusableView>(of type: T.Type, forSupplementaryViewOfKind kind: SupplementaryViewKind) {
        self.register(T.Nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.Identifier)
    }

    /// Registers `type` for `type.Identifier`
    ///
    /// - Parameter type: `UICollectionReusableView` subclass to register
    public func registerClass<T: UICollectionReusableView>(of type: T.Type, forSupplementaryViewOfKind kind: SupplementaryViewKind) {
        self.register(type, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.Identifier)
    }

    /// Dequeues a reusableView of type `T` for reuseIdentifier `T.Identifier`
    ///
    /// - Parameter indexPath: indexPath of reusableView
    /// - Returns: Your registered `UICollectionReusableView` subclass
    public func dequeueSupplementaryView<T: UICollectionReusableView>(of kind: SupplementaryViewKind, for indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.Identifier, for: indexPath) as! T
    }
}

public extension UICollectionView {
    /// Returns the indexPath of the one visible collection view cell. Designed for use in `scrollViewDidEndDecelerating`.
    ///
    /// **Will NOT be useful unless your itemSize == collectionView.size.**
    ///
    /// - Returns: IndexPath of the cell that is visible and centred.
    public func indexPathForVisibleFullSizeCell() -> IndexPath? {
        let indexPaths = self.indexPathsForVisibleItems
        if indexPaths.count == 1, let ip = indexPaths.first {
            return ip
        } else {
            /*
             `collectionView.indexPathsForVisibleItems()` sometimes returns multiple, especially if you scroll almost all the way and then let go.
             In that case, check x position of cells for the one at 0, which is the visible cell.
             */
            for ip in self.indexPathsForVisibleItems {
                if let attributes = self.layoutAttributesForItem(at: ip) {
                    let rect = self.convert(attributes.frame, to: self.superview)
                    if rect.origin.x == 0 {
                        return ip
                    }
                }
            }
        }

        return nil
    }
}
