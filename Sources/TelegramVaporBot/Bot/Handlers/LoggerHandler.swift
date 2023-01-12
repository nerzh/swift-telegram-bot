//
//  LoggerHandler.swift
//  
//
//  Created by Givi on 27.11.2019.
//

import Foundation
import Logging

public class TGLoggerHandler: TGHandlerPrtcl {
    
    public var id: Int = 0
    
    let logLevel: Logger.Level
    
    public init(level: Logger.Level) {
        self.logLevel = level
    }
    
    public func check(update: TGUpdate) -> Bool {
        return true
    }
    
    public func handle(update: TGUpdate, bot: TGBotPrtcl) async {
        TGBot.log.log(level: logLevel, update.logMessage)
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
            TGBot.log.error(error.logMessage)
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
