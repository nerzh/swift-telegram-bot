//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 13.04.2023.
//

import Foundation

public actor TGBaseHandler: TGHandlerPrtcl {
    
    public let id: SendableValue<Int> = .init(0)
    public let name: String
    let callbackAsync: TGHandlerCallbackAsync
    
    public init(
        name: String = String(describing: TGBaseHandler.self),
        _ callback: @escaping TGHandlerCallbackAsync
    ) {
        self.name = name
        self.callbackAsync = callback
    }
    
    public func check(update: TGUpdate) async -> Bool {
        true
    }
    
    public func handle(update: TGUpdate) async throws {
        try await callbackAsync(update)
    }
}
