// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a service message about a chat being joined by a user from a community.

 SeeAlso Telegram Bot API Reference:
 [CommunityChatJoined](https://core.telegram.org/bots/api#communitychatjoined)
 **/
public final class TGCommunityChatJoined: Codable, Sendable {

    /// Custom keys for coding/decoding `CommunityChatJoined` struct
    public enum CodingKeys: String, CodingKey {
        case community = "community"
    }

    /// The community from which the chat was joined
    public let community: TGCommunity

    public init (community: TGCommunity) {
        self.community = community
    }
}
