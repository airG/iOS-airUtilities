//
//  UIEdgeInsetsTests.swift
//  airUtilitiesTests
//
//  Created by Steven Thompson on 2018-01-22.
//  Copyright © 2018 airg. All rights reserved.
//

import XCTest

class UIEdgeInsetsTests: XCTestCase {
    
    func testAll() {
        let insets = UIEdgeInsets(all: 20)
        XCTAssertTrue(insets.top == 20)
        XCTAssertTrue(insets.bottom == 20)
        XCTAssertTrue(insets.left == 20)
        XCTAssertTrue(insets.right == 20)
    }
    
    func testVerticalHorizontal() {
        let justHorizontal = UIEdgeInsets(vertical: 0, horizontal: 10)
        XCTAssertTrue(justHorizontal.top == 0)
        XCTAssertTrue(justHorizontal.bottom == 0)
        XCTAssertTrue(justHorizontal.left == 10)
        XCTAssertTrue(justHorizontal.right == 10)

        let justVertical = UIEdgeInsets(vertical: 11, horizontal: 0)
        XCTAssertTrue(justVertical.top == 11)
        XCTAssertTrue(justVertical.bottom == 11)
        XCTAssertTrue(justVertical.left == 0)
        XCTAssertTrue(justVertical.right == 0)

        let both = UIEdgeInsets(vertical: 5, horizontal: 6)
        XCTAssertTrue(both.top == 5)
        XCTAssertTrue(both.bottom == 5)
        XCTAssertTrue(both.left == 6)
        XCTAssertTrue(both.right == 6)
    }
    
}
