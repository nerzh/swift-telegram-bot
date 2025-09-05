//
//  Created by Oleh Hudeichuk on 23.05.2021.
//

import Foundation

public typealias TGHandlerCallbackAsync = @Sendable (_ update: TGUpdate) async throws -> Void

public protocol TGHandlerPrtcl: Sendable {

    var id: SendableValue<Int> { get }
    var name: String { get }

    func check(update: TGUpdate) async -> Bool
    func handle(update: TGUpdate) async throws
}

extension TGHandlerPrtcl {
    public var name: String {
        return String(describing: Self.self)
    }
}
