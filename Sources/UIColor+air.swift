//
//  UIColor+air.swift
//  airUtilities
//
//  Created by Steven Thompson on 2018-02-01.
//  Copyright © 2018 airg. All rights reserved.
//

import Foundation

extension UIColor {
    /// Returns a UIColor where each component is startColor plus `progress` * the difference between the colors. Useful to animate a color changing from color 1 to 2
    ///
    /// - Parameters:
    ///   - color1: Start color
    ///   - color2: End color
    ///   - progress: Value from 0 to 1 
    /// - Returns: New `UIColor`
    static func color(between color1: UIColor, and color2: UIColor, progress: CGFloat) -> UIColor {
        let fromComponents = color1.components
        let toComponents = color2.components
        
        let r = fromComponents.r + progress * (toComponents.r - fromComponents.r)
        let g = fromComponents.g + progress * (toComponents.g - fromComponents.g)
        let b = fromComponents.b + progress * (toComponents.b - fromComponents.b)
        let a = fromComponents.a + progress * (toComponents.a - fromComponents.a)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    /// The RGBA components of the color
    var components: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        let components = self.cgColor.components!
        
        switch components.count == 2 {
        case true:
            return (r: components[0], g: components[0], b: components[0], a: components[1])
        case false:
            return (r: components[0], g: components[1], b: components[2], a: components[3])
        }
    }
    
    /// Returns a random color with alpha 1.0
    ///
    /// - Returns: Random color
    static func random() -> UIColor {
        return UIColor(red: CGFloat(arc4random_uniform(255))/CGFloat(255),
                       green: CGFloat(arc4random_uniform(255))/CGFloat(255),
                       blue: CGFloat(arc4random_uniform(255))/CGFloat(255),
                       alpha: 1.0)
    }
}
