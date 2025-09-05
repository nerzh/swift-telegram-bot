//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation
import SwiftRegularExpression

public final class TGRegexpHandler: TGHandlerPrtcl {
    
    public let id: SendableValue<Int> = .init(0)
    public let name: String
    
    let regexp: NSRegularExpression
    let callbackAsync: TGHandlerCallbackAsync
    let filters: SendableValue<TGFilter>
    
    public init(
        name: String = String(describing: TGRegexpHandler.self),
        regexp: NSRegularExpression,
        filters: TGFilter = .all,
        _ callback: @escaping TGHandlerCallbackAsync
    ) {
        self.name = name
        self.regexp = regexp
        self.filters = .init(filters)
        self.callbackAsync = callback
    }
    
    public convenience init(
        name: String = String(describing: TGRegexpHandler.self),
        pattern: String,
        options: NSRegularExpression.Options = [],
        filters: TGFilter = .all,
        _ callback: @escaping TGHandlerCallbackAsync
    ) throws {
        let regexp = try NSRegularExpression(pattern: pattern, options: options)
        self.init(
            name: name,
            regexp: regexp,
            filters: filters,
            callback
        )
    }
    
    public func check(update: TGUpdate) async -> Bool {
        guard let text = update.message?.text else { return false }
        return text.regexp(regexp.pattern, regexp.options).keys.count > 0
    }
    
    public func handle(update: TGUpdate) async throws {
        try await callbackAsync(update)
    }
}
