//
//  UIImageTests.swift
//  airUtilitiesTests
//
//  Created by Steven Thompson on 2018-01-17.
//  Copyright © 2018 airg. All rights reserved.
//

import XCTest

class UIImageTests: XCTestCase {
    
    func testGetPixelColour() {
        let rect = CGRect(x: 0, y: 0, width: 10, height: 10)
        
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(UIColor.red.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let pixelColor = image!.getPixelColor(at: CGPoint(x: 0, y: 0))
        
        XCTAssertEqual(UIColor.red, pixelColor)
    }
}
