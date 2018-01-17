//
//  BoolTests.swift
//  airUtilitiesTests
//
//  Created by Steven Thompson on 2018-01-17.
//  Copyright © 2018 airg. All rights reserved.
//

import XCTest

class BoolTests: XCTestCase {
    
    func testToggle() {
        var boolean = false
        XCTAssertFalse(boolean)
        boolean.toggle()
        XCTAssertTrue(boolean)
    }
    
}
