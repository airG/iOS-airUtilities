//
//  Array+air.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import Foundation

public extension Array where Element: Equatable {
    /// Append iff `!self.contains(newElement)`
    ///
    /// - parameter newElement: Element to possibly append
    public mutating func appendIfUnique(_ newElement: Element) {
        if !self.contains(newElement) {
            self.append(newElement)
        }
    }

    /// Appends each element iff `!self.contains(newElement)`
    ///
    /// - parameter newElements: Elements to possibly append
    public mutating func appendUniqueContents(of newElements: [Element]) {
        for new in newElements {
            self.appendIfUnique(new)
        }
    }

    /// Returns an array of Elements not included in self
    ///
    /// - parameter newElements: Elements to compare
    ///
    /// - returns: Array of unique elements
    public func uniqueContents(of newElements: [Element]) -> [Element] {
        return newElements.filter { (element) -> Bool in
            return !self.contains(element)
        }
    }

    /// Returns count of unique elements
    ///
    /// - parameter newElements: Elements to compare
    ///
    /// - returns: Count of uniques
    public func uniqueCount(from newElements: [Element]) -> Int {
        return uniqueContents(of: newElements).count
    }

    /// Removes element if it exists in self
    ///
    /// - Parameter element: Element to remove
    public mutating func removeElement(_ element: Element) {
        if let index = self.index(of: element) {
            self.remove(at: index)
        }
    }
}

// https://gist.github.com/yamaya/972338b68020e967d96e
public extension Array {
    /// Safely subscripts an array, returning nil if index is out of bounds
    ///
    /// - Parameter index:
    subscript (safe index: UInt) -> Element? {
        return Int(index) < count ? self[Int(index)] : nil
    }

    /// Safely subscripts an array, returning nil if index is out of bounds
    ///
    /// - Parameter index:
    subscript (safe index: Int) -> Element? {
        return Int(index) < count ? self[Int(index)] : nil
    }

    /// Safely subscripts an array, returning nil if index is out of bounds
    ///
    /// - Parameter index:
    func at(safe index: UInt) -> Element? {
        return Int(index) < count ? self[Int(index)] : nil
    }
    /// Safely subscripts an array, returning nil if index is out of bounds
    ///
    /// - Parameter index:
    func at(safe index: Int) -> Element? {
        return Int(index) < count ? self[Int(index)] : nil
    }
}
