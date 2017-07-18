//
//  URL+ExpressibleByStringLiteral.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import Foundation

extension URL: ExpressibleByStringLiteral {
    public typealias StringLiteralType = StaticString

    public init(stringLiteral value: URL.StringLiteralType) {
        guard let url = URL(string: "\(value)") else {
            fatalError("Couldn't create a URL from that string")
        }
        self = url
    }

    public init(unicodeScalarLiteral value: StaticString) {
        self.init(stringLiteral: value)
    }

    public init(extendedGraphemeClusterLiteral value: StaticString) {
        self.init(stringLiteral: value)
    }
}
