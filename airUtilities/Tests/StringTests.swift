//
//  StringTests.swift
//  airUtilitiesTests
//
//  Created by Steven Thompson on 2018-01-16.
//  Copyright © 2018 airg. All rights reserved.
//

import XCTest

class StringTests: XCTestCase {
    
    func testisNilOrEmpty() {
        var test: String? = nil
        
        XCTAssertTrue(test.isNilOrEmpty)
        
        test = "Hello"
        
        XCTAssertFalse(test.isNilOrEmpty)
    }
    
    func testSubscript() {
        let testString = "arrival"
        
        XCTAssertEqual(testString[3], "i")
    }
    
    func testRangesOf() {
        let testString: NSString = "Arrival is a movie called arrival"
        
        let ranges = testString.ranges(of: "arrival")
        let expectedRanges = [NSMakeRange(0, 7), NSMakeRange(26, 7)]
        XCTAssertEqual(ranges, expectedRanges)
        
        let caseSensitiveRanges = testString.ranges(of: "arrival", options: [])
        let expectedCaseSensitiveRanges = [NSMakeRange(26, 7)]
        XCTAssertEqual(caseSensitiveRanges, expectedCaseSensitiveRanges)
        
        let noRanges = testString.ranges(of: "Not this")
        XCTAssertEqual(noRanges, [])
    }
}
