// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to edit public data of a shared widget created by the bot. A shared widget can be edited at most once per second. On success, True is returned.


/// Parameters container struct for `editSharedWidgetData` method
public struct TGEditSharedWidgetDataParams: Encodable, Sendable {

    /// Unique identifier of the shared widget
    public let widgetId: String

    /// New public data of the widget, 0-1024 bytes; pass an empty string to remove the public data
    public let publicData: String

    /// The maximum amount of time in seconds that the public data of the widget may be cached client-side; 5-3600. If omitted, then the current value is kept, which is 30 by default.
    public let cacheTime: Int?

    /// Custom keys for coding/decoding `EditSharedWidgetDataParams` struct
    public enum CodingKeys: String, CodingKey {
            case widgetId = "widget_id"
            case publicData = "public_data"
            case cacheTime = "cache_time"
    }

    public init(widgetId: String, publicData: String, cacheTime: Int? = nil) {
            self.widgetId = widgetId
            self.publicData = publicData
            self.cacheTime = cacheTime
    }
}


public extension TGBot {

/**
 Use this method to edit public data of a shared widget created by the bot. A shared widget can be edited at most once per second. On success, True is returned.

 SeeAlso Telegram Bot API Reference:
 [EditSharedWidgetDataParams](https://core.telegram.org/bots/api#editsharedwidgetdata)
 
 - Parameters:
     - params: Parameters container, see `EditSharedWidgetDataParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func editSharedWidgetData(params: TGEditSharedWidgetDataParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("editSharedWidgetData")) else {
            throw BotError("Bad URL: \(getMethodURL("editSharedWidgetData"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
