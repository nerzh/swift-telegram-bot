// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to process a received chat join request query by showing a Mini App to the user before deciding the outcome. Call answerChatJoinRequestQuery to resolve the join request query based on the user interaction with the Mini App. Returns True on success.


/// Parameters container struct for `sendChatJoinRequestWebApp` method
public struct TGSendChatJoinRequestWebAppParams: Encodable, Sendable {

    /// Unique identifier of the join request query
    public let chatJoinRequestQueryId: String

    /// An HTTPS URL of a Web App to be opened with additional data as specified in Initializing Web Apps
    public let webAppUrl: String

    /// Custom keys for coding/decoding `SendChatJoinRequestWebAppParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatJoinRequestQueryId = "chat_join_request_query_id"
            case webAppUrl = "web_app_url"
    }

    public init(chatJoinRequestQueryId: String, webAppUrl: String) {
            self.chatJoinRequestQueryId = chatJoinRequestQueryId
            self.webAppUrl = webAppUrl
    }
}


public extension TGBot {

/**
 Use this method to process a received chat join request query by showing a Mini App to the user before deciding the outcome. Call answerChatJoinRequestQuery to resolve the join request query based on the user interaction with the Mini App. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SendChatJoinRequestWebAppParams](https://core.telegram.org/bots/api#sendchatjoinrequestwebapp)
 
 - Parameters:
     - params: Parameters container, see `SendChatJoinRequestWebAppParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func sendChatJoinRequestWebApp(params: TGSendChatJoinRequestWebAppParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("sendChatJoinRequestWebApp")) else {
            throw BotError("Bad URL: \(getMethodURL("sendChatJoinRequestWebApp"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
