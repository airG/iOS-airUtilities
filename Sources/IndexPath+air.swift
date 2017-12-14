//
//  IndexPath+air.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import Foundation

public extension IndexPath {
    /// Returns an `IndexPath` of `self.row + 1`
    ///
    /// - Returns: Next `IndexPath`
    public func nextInSection() -> IndexPath {
        return IndexPath(item: self.row+1, section: self.section)
    }
    
    /// Returns an `IndexPath` of `self.row - 1`.
    ///
    /// - Returns: Previous `IndexPath`
    public func previousInSection() -> IndexPath {
        return IndexPath(item: self.row-1, section: self.section)
    }
}

extension IndexPath {
    /// Modifies an `IndexPath`'s row by adding the provided number
    ///
    /// - Parameter number: Can be negative if you want to find a previous `IndexPath`
    mutating func modifyingRow(by number: Int) {
        self.modifyingBy(row: number, section: 0)
    }
    
    /// Modifies an `IndexPath` with the provided row and section
    ///
    /// - Parameters:
    ///   - row: Int to add to `self.row`
    ///   - section: Int to add to `section`
    mutating func modifyingBy(row: Int = 0, section: Int = 0) {
        self.row += row
        self.section += section
    }
}

