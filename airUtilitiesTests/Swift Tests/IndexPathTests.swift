//
//  IndexPathTests.swift
//  airUtilitiesTests
//
//  Created by Steven Thompson on 2018-01-16.
//  Copyright © 2018 airg. All rights reserved.
//

import XCTest

class IndexPathTests: XCTestCase {
    
    func testNextInSection() {
        let ip = IndexPath(item: 3, section: 2)
        let next = ip.nextInSection()
        
        XCTAssertEqual(IndexPath(item: 4, section: 2), next)
    }
    
    func testPreviousInSection() {
        let ip = IndexPath(item: 3, section: 2)
        let previous = ip.previousInSection()
        
        XCTAssertEqual(IndexPath(item: 2, section: 2), previous)
    }
    
    func testModifyingRow() {
        var ip = IndexPath(item: 3, section: 2)
        ip.modifyingRow(by: 2)
        
        XCTAssertEqual(ip, IndexPath(item: 5, section: 2))
    }
    
    func testModifyingBy() {
        var ip = IndexPath(item: 3, section: 2)
        ip.modifyingBy(row: 2, section: 0)
        
        XCTAssertEqual(ip, IndexPath(item: 5, section: 2))
        
        ip.modifyingBy(row: 0, section: -1)
        
        XCTAssertEqual(ip, IndexPath(item: 5, section: 1))
        
        ip.modifyingBy(row: 50, section: 200)
        
        XCTAssertEqual(ip, IndexPath(item: 55, section: 201))
    }

}
