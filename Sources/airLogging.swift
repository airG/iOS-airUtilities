//
//  airLogging.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import Foundation
import os.log

/// Provides possible levels to print as, and set for filtering
public enum LogLevel: Int, CustomStringConvertible {
    /// Fault
    case fault=0
    /// Warning
    case error
    /// Default
    case `default`
    /// Info
    case info
    /// Debug
    case debug
    
    /// Checks to see if the provided level is higher than `self`
    ///
    /// - Parameter otherLevel:
    /// - Returns:
    func isAtLeast(_ otherLevel: LogLevel) -> Bool {
        return self.rawValue <= otherLevel.rawValue
    }
    
    /// Self converted to `OSLogType`
    @available(iOS 10.0, *)
    var osLogType: OSLogType {
        switch self {
        default:
            return .error;
        }
    }
    
    /// String value of the` LogLevel`
    public var description: String {
        switch self {
        case .fault: return "fault"
        case .error: return "error"
        case .default: return "default"
        case .info: return "info"
        case .debug: return "debug"
        }
    }
}

/// Logging will ignore any messages below this level. Set this anywhere to change the default.
public var minimumLogLevel: LogLevel = .default

/// When passing an Error, logging assumes you want to log it as .error. Set this anywhere to change the default.
public var minimumErrorLogLevel: LogLevel = .error

/// Log an error to the console. Assumes level: minimumErrorLogLevel unless other level is specified.
///
/// - Parameters:
///   - error: Error type for logging. Doesn't log if error == nil
///   - level: Log level of the message, subject to `minimumErrorLogLevel`
///   - category: When logging to the system console you can group similar messages by category to categorize and filter related log messages
///   - file: Not needed, gets these automatically
///   - function: Not needed, gets these automatically
///   - line: Not needed, gets these automatically
public func Log(_ error: Error?, as level: LogLevel = minimumErrorLogLevel, category: String? = nil, file: String = #file, function: String = #function, line: Int = #line) {
    guard level.isAtLeast(minimumErrorLogLevel) else {
        return
    }
    
    if let error = error {
        log("\(error)", as: level, category: category, file: file, function: function, line: line)
    }
}

/// Logs a message to the console. Assumes level: minimumLogLevel unless other level is specified.
///
/// - Parameters:
///   - message: String to log, subject to `minimumLogLevel`.
///   - level: Log level of the message, subject to `minimumLogLevel`
///   - category: When logging to the system console you can group similar messages by category to categorize and filter related log messages
///   - file: Not needed, gets these automatically
///   - function: Not needed, gets these automatically
///   - line: Not needed, gets these automatically
public func Log(_ message: String?, as level: LogLevel = minimumLogLevel, category: String? = nil, file: String = #file, function: String = #function, line: Int = #line) {
    guard level.isAtLeast(minimumLogLevel) else {
        return
    }
    
    if let message = message {
        log(message, as: level, category: category, file: file, function: function, line: line)
    }
}

fileprivate func log(_ message: String, as level: LogLevel, category: String? = nil, file: String = #file, function: String = #function, line: Int = #line) {
    let singleFile: String
    if let f = file.components(separatedBy: "/").last?.components(separatedBy: ".").first {
        singleFile = f
    } else {
        singleFile = ""
    }
    
    if #available(iOS 10.0, *), !UIDevice.isSimulator {
        let osMes: StaticString = "%@:%d %@ - %@"
        let log = OSLog(subsystem: "\( Bundle.main.bundleIdentifier ?? "" )", category: category ?? "")
        os_log(osMes, log: log, type: level.osLogType, singleFile, line, function, message)
    } else {
        let mes = "\(dateFormatter.string(from: NSDate() as Date)) <\(level)> \(singleFile):\(line) \(function) - \(message)"
        NSLog(mes)
    }
}

fileprivate let dateFormatter: DateFormatter = {
    let df = DateFormatter()
    df.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    return df
}()
