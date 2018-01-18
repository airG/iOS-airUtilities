//
//  UIStackViewTests.swift
//  airUtilitiesTests
//
//  Created by Steven Thompson on 2018-01-17.
//  Copyright © 2018 airg. All rights reserved.
//

import XCTest

class UIStackViewTests: XCTestCase {
    
    func testRemoveAllArrangedSubviews() {
        let stackView = UIStackView()
        let view1 = UIView()
        let view2 = UIView()
        
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        
        XCTAssertEqual(stackView.arrangedSubviews, [view1, view2])

        stackView.removeAllArrangedSubviews()
        
        XCTAssertEqual(stackView.arrangedSubviews, [])
    }
    
}
