//
//  SendableValue.swift
//  SwiftTelegramSdk
//
//  Created by Oleh Hudeichuk on 26.08.2025.
//

import Foundation

public actor SendableValue<Value: Sendable> {
    private var data: Value
    public init(_ val: Value) {
        self.data = val
    }
    
    public var value: Value {
        get {
            self.data
        }
    }
    
    @discardableResult
    public func change(
        _ block: @escaping @Sendable (inout Value) throws -> Void
    ) async throws -> Value {
        try block(&data)
        return data
    }
    
    @discardableResult
    public func change(
        _ block: @escaping @Sendable (inout Value) -> Void
    ) async -> Value {
        block(&data)
        return data
    }
    
    @discardableResult
    public func change(
        _ block: @escaping @Sendable (_ oldValue: Value) async throws -> Value
    ) async throws -> Value {
        data = try await block(data)
        return data
    }
    
    @discardableResult
    public func change(
        _ block: @escaping @Sendable (_ oldValue: Value) async -> Value
    ) async -> Value {
        data = await block(data)
        return data
    }
}
