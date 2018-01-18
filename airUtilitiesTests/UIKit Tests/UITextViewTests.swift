//
//  UITextViewTests.swift
//  airUtilitiesTests
//
//  Created by Steven Thompson on 2018-01-17.
//  Copyright © 2018 airg. All rights reserved.
//

import XCTest

class UITextViewTests: XCTestCase {
    
    func testIsTextEmpty() {
        let textView = UITextView()
        XCTAssertTrue(textView.isTextEmpty)
        
        textView.text = "Not empty!"
        
        XCTAssertFalse(textView.isTextEmpty)
    }
    
}
