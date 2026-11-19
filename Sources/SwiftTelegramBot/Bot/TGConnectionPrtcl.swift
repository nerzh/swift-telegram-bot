//
//  Created by Oleh Hudeichuk on 19.11.2026.
//

public protocol TGConnectionPrtcl: Sendable {
    // Let the connection record a lifecycle change on the caller's actor before suspending.
    @discardableResult
    nonisolated(nonsending) func start(bot: TGBot) async throws -> Bool

    @discardableResult
    nonisolated(nonsending) func stop(bot: TGBot) async throws -> Bool
}
