//
//  UITextViewTests.swift
//  airUtilitiesTests
//
//  Created by Steven Thompson on 2018-01-17.
//  Copyright © 2018 airg. All rights reserved.
//

import XCTest

class UITextFieldTests: XCTestCase {
    
    func testIsTextEmpty() {
        let textField = UITextField()
        XCTAssertTrue(textField.isTextEmpty)
        
        textField.text = "Not empty!"
        
        XCTAssertFalse(textField.isTextEmpty)
    }
    
}
