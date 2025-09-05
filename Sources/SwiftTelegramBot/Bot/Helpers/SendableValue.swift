//
//  SendableValue.swift
//  SwiftTelegramSdk
//
//  Created by Oleh Hudeichuk on 26.08.2025.
//

import Foundation

final public class SendableValue<Value>: @unchecked Sendable {
    private var data: Value
    private let queue = DispatchQueue(
        label: "SendableValue.queue",
        attributes: .concurrent
    )

    init(_ val: Value) {
        self.data = val
    }

    public var value: Value {
        get async {
            await withCheckedContinuation { continuation in
                queue.async {
                    continuation.resume(returning: self.data)
                }
            }
        }
    }

    @discardableResult
    public func change(
        _ block: @escaping @Sendable (inout Value) throws -> Void
    ) async throws -> Value {
        try await withCheckedThrowingContinuation { continuation in
            queue.async(flags: .barrier) {
                do {
                    try block(&self.data)
                    continuation.resume(returning: self.data)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    @discardableResult
    public func change(
        _ block: @escaping @Sendable (inout Value) -> Void
    ) async -> Value {
        await withCheckedContinuation { continuation in
            queue.async(flags: .barrier) {
                block(&self.data)
                continuation.resume(returning: self.data)
            }
        }
    }
}
