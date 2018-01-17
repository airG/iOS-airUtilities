//
//  Bool+air.swift
//  airUtilities
//
//  Created by Steven Thompson on 2018-01-16.
//  Copyright © 2018 airg. All rights reserved.
//

import Foundation

public extension Bool {
    /// Toggles the value of self, instead of having to reassign
    public mutating func toggle() {
        self = !self
    }
}
