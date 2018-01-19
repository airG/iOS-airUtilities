//
//  DictionaryTests.swift
//  airUtilitiesTests
//
//  Created by Steven Thompson on 2018-01-18.
//  Copyright © 2018 airg. All rights reserved.
//

import XCTest
import airUtilities

class DictionaryTests: XCTestCase {
    
    func testOperator() {
        var testDict: [String: String] = ["1": "1",
                                          "2": "2",
                                          "3": "3"]
        
        testDict += ["3": "0"]
        
        XCTAssertEqual(testDict, ["1": "1",
                                  "2": "2",
                                  "3": "0"])
    }
    
}
