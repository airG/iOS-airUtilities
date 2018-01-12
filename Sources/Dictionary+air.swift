//
//  Dictionary+air.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import Foundation

public extension Dictionary {
    /// Update left dictionary with keys, values from right
    ///
    /// - parameter left:  [Key: Value]
    /// - parameter right: [Key: Value]
    public static func += (left: inout [Key: Value], right: [Key: Value]) {
        for (k, v) in right {
            left[k] = v
        }
    }
}
