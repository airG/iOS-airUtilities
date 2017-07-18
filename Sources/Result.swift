//
//  Result.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import Foundation

public enum Result<T>: CustomStringConvertible, CustomDebugStringConvertible {
    case success(T)
    case failure(Error)

    //MARK: CustomStringConvertible
    public var description: String {
        switch self {
        case let .success(value):
            return ".success(\(value))"
        case let .failure(value):
            return ".failure(\(value))"
        }
    }

    //MARK: CustomDebugStringConvertible
    public var debugDescription: String {
        return description
    }
}

public extension Result {
    /// Init with an optional value and Error. Useful to convert UIKit APIs that return a `(T?, Error?)` into a Result type.
    ///
    /// - Parameters:
    ///   - value: Optional success value
    ///   - error: Optional Error
    public init(value: T?, error: Error?) {
        switch (value, error) {
        case (let v?, _):
            self = .success(v)
        case (nil, let e?):
            self = .failure(e)
        case (nil, nil):
            let error = NSError(domain: "ResultErrorDomain", code: -1,
                                userInfo: [NSLocalizedDescriptionKey:
                                    "Invalid input: value and error were both nil."])
            self = .failure(error)
        }
    }
}
