//
//  LoggerHandler.swift
//  
//
//  Created by Givi on 27.11.2019.
//

import Foundation
import Logging

public final class TGLoggerHandler: TGHandlerPrtcl {
    
    public let id: SendableValue<Int> = .init(0)
    public let name: String
    let log: Logger
    
    public init(
        log: Logger,
        name: String
    ) {
        self.name = name
        self.log = log
    }
    
    public func check(update: TGUpdate) async -> Bool {
        return true
    }
    
    public func handle(update: TGUpdate) async throws {
        log.log(level: log.logLevel, update.logMessage)
    }
}

extension TGUpdate {
    var description: String {
        //TODO: Improve description algorithm, serialization/deserialization too heavy
        var resultString = "[]"
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let data = try encoder.encode(self)
            if let json = String(data: data, encoding: .utf8) {
                resultString = json
            }
        } catch {
            Logger(label: "TGUpdate").log(level: .error, error.logMessage)
        }
        return resultString
    }
    
    var logMessage: Logger.Message {
        return Logger.Message(stringLiteral: description)
    }
}

extension Array where Element: TGUpdate {
    var description: String {
        var str: String = ""
        self.forEach { (elem) in
            str.append(elem.description)
            str.append("\n")
        }
        return str
    }
}
