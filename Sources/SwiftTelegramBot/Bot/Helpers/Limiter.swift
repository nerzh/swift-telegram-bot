//
//  Limiter.swift
//  SwiftTelegramSdk
//
//  Created by Oleh Hudeichuk on 02.09.2025.
//

import Foundation

public actor LimiterAsync {
    private let maxRequests: Int
    private let interval: UInt64
    private var currentCount = 0
    private var waiters: [CheckedContinuation<Bool, Never>] = []
    private var isTicking = false
    private var task: Task<Void, Never>?

    public init(maxRequests: Int, per interval: TimeInterval) {
        self.maxRequests = maxRequests
        self.interval = UInt64(interval * 1_000_000_000) // sec -> ns
    }
    
    public func stop() async {
        task?.cancel()
    }

    @discardableResult
    public func run<T: Sendable>(_ operation: @Sendable (_ isCancelled: Bool) async throws -> T) async rethrows -> T {
        return try await operation(!(await acquire()))
    }
    
    @discardableResult
    public func run<T: Sendable>(_ operation: @Sendable () async throws -> T) async rethrows -> T {
        await acquire()
        return try await operation()
    }
    
    @discardableResult
    public func acquire() async -> Bool {
        let isCancelled: Bool
        if currentCount < maxRequests {
            currentCount += 1
            isCancelled = startTimerIfNeeded()
        } else {
            isCancelled = await withCheckedContinuation { (continuation: CheckedContinuation<Bool, Never>) in
                waiters.append(continuation)
            }
        }
        
        return !isCancelled
    }

    private func startTimerIfNeeded() -> Bool {
        if task?.isCancelled ?? false { return true }
        guard !isTicking else { return false }
        isTicking = true
        
        task = Task {
            while true {
                try? await Task.sleep(nanoseconds: interval)
                currentCount = 0

                let toResume = waiters.prefix(maxRequests)
                currentCount = toResume.count
                waiters.removeFirst(toResume.count)
                for waiter in toResume {
                    waiter.resume(returning: task?.isCancelled ?? false)
                }

                if waiters.isEmpty {
                    isTicking = false
                    break
                }
            }
        }
        
        return task?.isCancelled ?? false
    }
    
    deinit {
        for waiter in waiters {
            waiter.resume(returning: task?.isCancelled ?? false)
        }
    }
}
