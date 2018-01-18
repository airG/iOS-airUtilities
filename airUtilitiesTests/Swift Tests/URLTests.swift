//
//  URLTests.swift
//  airUtilitiesTests
//
//  Created by Steven Thompson on 2018-01-17.
//  Copyright © 2018 airg. All rights reserved.
//

import XCTest

class URLTests: XCTestCase {
    
    func testInitStringLiteral() {
        let testString: StaticString = "http://www.apple.ca"
        
        let testUrl = URL.init(stringLiteral: testString)
        XCTAssertNotNil(testUrl)
    }

    func testInitUnicodeScalarLiteral() {
        let testString: StaticString = "http://www.apple.ca"
        
        let testUrl = URL.init(unicodeScalarLiteral: testString)
        XCTAssertNotNil(testUrl)
    }
    
    func testInitExtendedGraphemeClusterLiteral() {
        let testString: StaticString = "http://www.apple.ca"
        
        let testUrl = URL.init(extendedGraphemeClusterLiteral: testString)
        XCTAssertNotNil(testUrl)
    }

}
