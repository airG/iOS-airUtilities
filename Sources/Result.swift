//
//  Result.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import Foundation

/// A generic type of either .success(T), or .failure(U)
public enum Result<T, U>: CustomStringConvertible, CustomDebugStringConvertible {
    /// Success with associated value `T`
    case success(T)
    /// Failure with associated value `U`
    case failure(U)

    //MARK: CustomStringConvertible
    
    /// String description of the result
    public var description: String {
        switch self {
        case let .success(value):
            return ".success(\(value))"
        case let .failure(value):
            return ".failure(\(value))"
        }
    }

    //MARK: CustomDebugStringConvertible
    
    /// String description of the result
    public var debugDescription: String {
        return description
    }
}

public extension Result {
    /// Init with two optional values Useful to convert UIKit APIs that return a `(T?, Error?)` into a Result type.
    ///
    /// - Parameters:
    ///   - value: Optional success value
    ///   - error: Optional failure value
    public init?(value: T?, error: U?) {
        switch (value, error) {
        case (let v?, _):
            self = .success(v)
        case (nil, let e?):
            self = .failure(e)
        case (nil, nil):
            return nil
        }
    }
}

/// The Result type of <T, Swift.Error> is common enough to deserve this typealias
public typealias ResultWithError<T> = Result<T, Swift.Error>
