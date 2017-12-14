//
//  IndexPath+air.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import Foundation

public extension IndexPath {
    public func nextInSection() -> IndexPath {
        return IndexPath(item: self.row+1, section: self.section)
    }

    public func previousInSection() -> IndexPath {
        return IndexPath(item: self.row-1, section: self.section)
    }
}

extension IndexPath {
    mutating func modifyingRow(by number: Int) -> IndexPath {
        return self.modifying(row: number, section: 0)
    }

    mutating func modifying(row: Int = 0, section: Int = 0) -> IndexPath {
        self.row += row
        self.section += section
        return self
    }
}
