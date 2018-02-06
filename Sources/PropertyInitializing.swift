//
//  PropertyInitializing.swift
//  airUtilities
//
//  Created by Steven Thompson on 2018-01-22.
//  Copyright © 2018 airg. All rights reserved.
//

import Foundation

/// `PropertyInitializing` allows you to initialize and set preperties with a property function
public protocol PropertyInitializing {
    /// Needed for the PropertyInitializing protocol extension
    init()
}

extension PropertyInitializing {
    /// Init with the provided properties, as:
    /**
     let label = UILabel {
        $0.textColor = .red
     }
    */
    /// Please be careful that in using this you aren't ignoring a default initializer you should be using instead.
    ///
    /// - Parameter properties: Properties to apply to the new object
    public init(properties: ((Self) -> Void)) {
        self.init()
        properties(self)
    }
}

extension NSObject: PropertyInitializing {}
