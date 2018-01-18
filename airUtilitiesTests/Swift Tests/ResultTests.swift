//
//  ResultTests.swift
//  airUtilitiesTests
//
//  Created by Steven Thompson on 2018-01-17.
//  Copyright © 2018 airg. All rights reserved.
//

import XCTest
import airUtilities

class ResultTests: XCTestCase {
    
    func testDescription() {
        let success = Result<String, Bool>.success("yay!")
        XCTAssertEqual(success.description, ".success(yay!)")
        
        let failure = Result<String, Bool>.failure(false)
        XCTAssertEqual(failure.description, ".failure(false)")
    }
    
    func testDebugDescription() {
        let success = Result<String, Bool>.success("yay!")
        XCTAssertEqual(success.debugDescription, ".success(yay!)")
        
        let failure = Result<String, Bool>.failure(false)
        XCTAssertEqual(failure.debugDescription, ".failure(false)")
    }

    func testInitWithValueAndError() {
        enum MyError: Error {
            case oops
        }
        
        let value = "value"
        let error = MyError.oops
        
        let success: Result<String, Error> = Result(value: value, error: nil)!
        XCTAssertEqual(Result<String, Error>.success("value").description, success.description)
        
        let failure = Result<String, Error>(value: nil, error: error)!
        XCTAssertEqual(Result<String, Error>.failure(MyError.oops).description, failure.description)

        let empty = Result<String, Error>(value: nil, error: nil)
        XCTAssertNil(empty)
    }
}
