//
//  String+air.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import Foundation

public extension Optional where Wrapped == String {
    
    /// Returns true if `self` is either nil or an empty string
    public var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}

public extension String {
    public subscript (i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
}

public extension NSString {
    /// Function to return an array of `NSRange`s for `substring` in `self`. Searches the string from index 0, so `ranges(of: ).first` will be the first `NSRange` in the string.
    
    /// Note this is returning an `NSRange`, not a Swift `Range`.
    /// See http://stackoverflow.com/a/27041376/2580195 for why these two types of ranges are incompatible.
    ///
    /// If you only need the first range, and not as `NSRange`, use Swift's `range(of: )`.
    ///
    /// - Parameters:
    ///   - searchString: Substring to find.
    ///   - mask: `NSString.CompareOptions`, defaults to `NSString.CompareOptions.caseInsensitive`.
    /// - Returns: Array of `NSRange`s where `searchString` is in `self`.
    public func ranges(of searchString: String, options mask: NSString.CompareOptions = [NSString.CompareOptions.caseInsensitive]) -> [NSRange] {
        var searchRange = NSRange(location: 0, length: self.length)
        var ranges: [NSRange] = []
        
        while (searchRange.location < self.length) {
            searchRange.length = self.length - searchRange.location
            
            let newRange = self.range(of: searchString, options: mask, range: searchRange)
            if newRange.location != NSNotFound {
                ranges.append(newRange)
                searchRange.location = newRange.location + newRange.length
            } else {
                break
            }
        }
        
        return ranges
    }
}
