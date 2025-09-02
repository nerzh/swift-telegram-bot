//
//  Created by Oleh Hudeichuk on 10.03.2023.
//

import Foundation

public protocol Cases {
    var caseName: String { get }
}

public extension Cases {
    var caseName: String { "\(String(describing: self))" }
}

public protocol ErrorCommon: Error, LocalizedError, CustomStringConvertible, CustomDebugStringConvertible, Decodable {
    var reason: String { get set }
    
    init()
    init(_ reason: String, file: String, function: String, line: Int)
    init(_ error: Error, errorLevel: ErrorCommonLevel, file: String, function: String, line: Int)
    init(_ error: Error, exReason: String, errorLevel: ErrorCommonLevel, file: String, function: String, line: Int)
    
    static func error(_ error: Error, file: String, function: String, line: Int) -> Self
}

public enum ErrorCommonLevel: Cases {
    case release
    case debug
}

public extension ErrorCommon {
    var description: String { "\(reason)" }
    var debugDescription: String { self.description }
    var errorDescription: String? { self.description }
    var failureReason: String? { self.description }
    var recoverySuggestion: String? { self.description }
    var helpAnchor: String? { self.description }
    #warning("if localizedDescription not defined we have sigterm for linux https://github.com/swiftlang/swift-corelibs-foundation/issues/5221")
    var localizedDescription: String { self.description }
    
    init(_ reason: String, file: String = #file, function: String = #function, line: Int = #line) {
        self.init()
        self.reason = "\(file), \(function), line \(line): \(reason)"
    }
    
    init(_ error: Error, errorLevel: ErrorCommonLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        self.init(Self.getDetailedErrorMessage(error, errorLevel: errorLevel), file: file, function: function, line: line)
    }
    
    init(_ error: Error, exReason: String, errorLevel: ErrorCommonLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        let textError: String = "[\(exReason)] \(Self.getDetailedErrorMessage(error, errorLevel: errorLevel))"
        self.init(textError, file: file, function: function, line: line)
    }
    
    static func error(_ error: Error, file: String = #file, function: String = #function, line: Int = #line) -> Self {
        Self(error, errorLevel: .debug, file: file, function: function, line: line)
    }
    
    private static func getDetailedErrorMessage(_ error: Error, errorLevel: ErrorCommonLevel = .debug) -> String {
        if let localizedError = error as? LocalizedError {
            if let errorDescription = localizedError.errorDescription {
                return errorDescription
            }
            if let failureReason = localizedError.failureReason {
                return failureReason
            }
            if let recoverySuggestion = localizedError.recoverySuggestion {
                return recoverySuggestion
            }
            if let helpAnchor = localizedError.helpAnchor {
                return helpAnchor
            }
        }
        
        let isCustomStringConvertibleError: Bool = error is CustomStringConvertible
        let isCustomDebugStringConvertibleError: Bool = error is CustomDebugStringConvertible
        
        if isCustomStringConvertibleError && isCustomDebugStringConvertibleError {
            switch errorLevel {
            case .release:
                return (error as CustomStringConvertible).description
            case .debug:
                return (error as CustomDebugStringConvertible).debugDescription
            }
        }
        
        if isCustomStringConvertibleError {
            return (error as CustomStringConvertible).description
        }
        
        if isCustomDebugStringConvertibleError {
            return (error as CustomDebugStringConvertible).debugDescription
        }
        
        return String(reflecting: error)
    }
}

public struct SEPCommonError: ErrorCommon {
    public var reason: String = ""
    public init() {}
}
