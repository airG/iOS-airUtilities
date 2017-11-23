//
//  UIGestureRecognizer+air.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-11-23.
//  Copyright © 2017 airg. All rights reserved.
//

import Foundation

extension UIGestureRecognizer {
    /// Cancels any existing touches and resets to a ready state
    func cancel() {
        // If you change this property to false while a gesture recognizer is currently recognizing a gesture, the gesture recognizer transitions to a cancelled state.
        isEnabled = false
        isEnabled = true
    }
}
