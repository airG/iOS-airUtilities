//
//  ArrayTests.swift
//  airUtilitiesTests
//
//  Created by Steven Thompson on 2018-01-12.
//  Copyright © 2018 airg. All rights reserved.
//

import XCTest

class ArrayTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAppendUniqueElement() {
        var testArray = [1, 2, 3, 4]
        testArray.appendIfUnique(5)
        
        XCTAssertEqual(testArray, [1, 2, 3, 4, 5])
        
        testArray.appendIfUnique(5)
        
        XCTAssertEqual(testArray, [1, 2, 3, 4, 5])
    }
    
    func testAppendUniqueContents() {
        var testArray = [1, 2, 3, 4]
        testArray.appendUniqueContents(of: [5, 6])
        
        XCTAssertEqual(testArray, [1, 2, 3, 4, 5, 6])
        
        testArray.appendUniqueContents(of: [6, 7])
        
        XCTAssertEqual(testArray, [1, 2, 3, 4, 5, 6, 7])
    }
    
    func testUniqueContents() {
        let testArray = [1, 2, 3, 4]
        XCTAssertEqual(testArray.uniqueContents(of: [3, 4, 5]), [5])
    }
    
    func testUniqueCount() {
        let testArray = [1, 2, 3, 4]
        XCTAssertEqual(testArray.uniqueCount(from: [3, 4, 5]), 1)
    }
    
    func testRemoveElement() {
        var testArray: [Int] = [1, 2, 3, 4]
        testArray.removeElement(2)
        
        XCTAssertEqual(testArray, [1, 3, 4])
    }
    
    func testSafeSubscript() {
        let testArray = [1, 2, 3, 4, 5]
        
        let uIndex: UInt = 2
        let test1 = testArray[safe: uIndex]
        XCTAssertEqual(test1, 3)
        
        let test2 = testArray.at(safe: uIndex)
        XCTAssertEqual(test2, 3)
        
        let index: Int = 1
        let test3 = testArray[safe: index]
        XCTAssertEqual(test3, 2)
        
        let test4 = testArray.at(safe: index)
        XCTAssertEqual(test4, 2)
    }
}
