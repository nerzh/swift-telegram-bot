// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Reposts a story on behalf of a business account from another business account. Both business accounts must be managed by the same bot, and the story on the source account must have been posted (or reposted) by the bot. Requires the can_manage_stories business bot right for both business accounts. Returns Story on success.


/// Parameters container struct for `repostStory` method
public struct TGRepostStoryParams: Encodable, Sendable {

    /// Unique identifier of the business connection
    public let businessConnectionId: String

    /// Unique identifier of the chat which posted the story that should be reposted
    public let fromChatId: Int64

    /// Unique identifier of the story that should be reposted
    public let fromStoryId: Int

    /// Period after which the story is moved to the archive, in seconds; must be one of 6 * 3600, 12 * 3600, 86400, or 2 * 86400
    public let activePeriod: Int

    /// Pass True to keep the story accessible after it expires
    public let postToChatPage: Bool?

    /// Pass True if the content of the story must be protected from forwarding and screenshotting
    public let protectContent: Bool?

    /// Custom keys for coding/decoding `RepostStoryParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case fromChatId = "from_chat_id"
            case fromStoryId = "from_story_id"
            case activePeriod = "active_period"
            case postToChatPage = "post_to_chat_page"
            case protectContent = "protect_content"
    }

    public init(businessConnectionId: String, fromChatId: Int64, fromStoryId: Int, activePeriod: Int, postToChatPage: Bool? = nil, protectContent: Bool? = nil) {
            self.businessConnectionId = businessConnectionId
            self.fromChatId = fromChatId
            self.fromStoryId = fromStoryId
            self.activePeriod = activePeriod
            self.postToChatPage = postToChatPage
            self.protectContent = protectContent
    }
}


public extension TGBot {

/**
 Reposts a story on behalf of a business account from another business account. Both business accounts must be managed by the same bot, and the story on the source account must have been posted (or reposted) by the bot. Requires the can_manage_stories business bot right for both business accounts. Returns Story on success.

 SeeAlso Telegram Bot API Reference:
 [RepostStoryParams](https://core.telegram.org/bots/api#repoststory)
 
 - Parameters:
     - params: Parameters container, see `RepostStoryParams` struct
 - Throws: Throws on errors
 - Returns: `TGStory`
 */

    @discardableResult
    func repostStory(params: TGRepostStoryParams) async throws -> TGStory {
        guard let methodURL: URL = .init(string: getMethodURL("repostStory")) else {
            throw BotError("Bad URL: \(getMethodURL("repostStory"))")
        }
        let result: TGStory = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
