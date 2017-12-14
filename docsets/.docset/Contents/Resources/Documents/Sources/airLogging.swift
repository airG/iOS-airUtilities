//
//  airLogging.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import Foundation

public enum LogLevel: Int {
    case error=0, warning, info, debug, verbose

    func isAtLeast(_ otherLevel: LogLevel) -> Bool {
        return self.rawValue <= otherLevel.rawValue
    }
}

/// Logging will ignore any messages below this level. Set this anywhere to change the default.
public var minimumLogLevel: LogLevel = .info

/// When passing an Error, logging assumes you want to log it as .error. Set this anywhere to change the default.
public var minimumErrorLogLevel: LogLevel = .error

/// Log an error to the console. Assumes level: minimumErrorLogLevel unless other level is specified.
///
/// - Parameters:
///   - error: Error type for logging. Doesn't log if error == nil
///   - level: Log level of the message, subject to `minimumErrorLogLevel`
///   - file: Not needed, gets these automatically
///   - line: Not needed, gets these automatically
public func Log(_ error: Error?, as level: LogLevel = minimumErrorLogLevel, file: String = #file, function: String = #function, line: Int = #line) {
    guard level.isAtLeast(minimumErrorLogLevel) else {
        return
    }

    if let error = error {
        Log("\(error)", as: level, file: file, function: function, line: line)
    }
}

/// Logs a message to the console. Assumes level: minimumLogLevel unless other level is specified.
///
/// - Parameters:
///   - message: String to log, subject to `minimumLogLevel`.
///   - level: Log level of the message, subject to `minimumLogLevel`
///   - file: Not needed, gets these automatically
///   - line: Not needed, gets these automatically
public func Log(_ message: String?, as level: LogLevel = minimumLogLevel, file: String = #file, function: String = #function, line: Int = #line) {
    guard level.isAtLeast(minimumLogLevel) else {
        return
    }

    if let message = message {
        Log(message, as: level, file: file, function: function, line: line)
    }
}

fileprivate func Log(_ message: String, as level: LogLevel, file: String = #file, function: String = #function, line: Int = #line) {
    let singleFile: String
    if let f = file.components(separatedBy: "/").last {
        singleFile = f.replacingOccurrences(of: ".swift", with: "")
    } else {
        singleFile = ""
    }

    let mes = "\(dateFormatter.string(from: NSDate() as Date)) <\(level)> \(singleFile):\(line) \(function) - \(message)"
    print(mes)
}

fileprivate let dateFormatter: DateFormatter = {
    let df = DateFormatter()
    df.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    return df
}()
