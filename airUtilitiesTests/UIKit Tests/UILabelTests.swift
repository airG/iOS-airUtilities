//
//  UILabelTests.swift
//  airUtilitiesTests
//
//  Created by Steven Thompson on 2018-01-17.
//  Copyright © 2018 airg. All rights reserved.
//

import XCTest

class UILabelTests: XCTestCase {
    
    func testIsTextEmpty() {
        let label = UILabel()
        XCTAssertTrue(label.isTextEmpty)
        
        label.text = "Not empty!"
        
        XCTAssertFalse(label.isTextEmpty)
    }
    
}
