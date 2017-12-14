//
//  NetworkIndicator+air.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import UIKit

/// Starts spinning the network indicator, dispatches to the main thread.
public func startNetworkIndicator() {
    DispatchQueue.main.async {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
}

/// Stops spinning the network indicator, dispatches to the main thread.
public func stopNetworkIndicator() {
    DispatchQueue.main.async {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
