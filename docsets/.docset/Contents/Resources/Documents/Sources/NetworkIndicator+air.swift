//
//  NetworkIndicator+air.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import UIKit

public func startNetworkIndicator() {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
}

public func stopNetworkIndicator() {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
}
