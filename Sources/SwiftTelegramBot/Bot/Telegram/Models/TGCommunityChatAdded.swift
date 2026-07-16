// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a service message about a chat being added to a community.

 SeeAlso Telegram Bot API Reference:
 [CommunityChatAdded](https://core.telegram.org/bots/api#communitychatadded)
 **/
public final class TGCommunityChatAdded: Codable, Sendable {

    /// Custom keys for coding/decoding `CommunityChatAdded` struct
    public enum CodingKeys: String, CodingKey {
        case community = "community"
    }

    /// The new community to which the chat belongs
    public let community: TGCommunity

    public init (community: TGCommunity) {
        self.community = community
    }
}
