//
//  UIViewControllerTests.swift
//  airUtilitiesTests
//
//  Created by Steven Thompson on 2018-01-17.
//  Copyright © 2018 airg. All rights reserved.
//

import XCTest
import airUtilities

class UIViewControllerTests: XCTestCase {
    
    func testIdentifier() {
        class TestViewController: UIViewController { }
        
        XCTAssertEqual(TestViewController.Identifier, String(describing: TestViewController.self))
    }
    
}
