//
//  Window+air.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import UIKit

public extension UIWindow {
    public var topMostController: UIViewController {
        var top = self.rootViewController!

        while let new = top.presentedViewController {
            top = new
        }

        return top
    }
}
