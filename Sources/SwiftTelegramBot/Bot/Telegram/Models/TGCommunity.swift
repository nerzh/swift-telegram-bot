// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a community (a group of chats).

 SeeAlso Telegram Bot API Reference:
 [Community](https://core.telegram.org/bots/api#community)
 **/
public final class TGCommunity: Codable, Sendable {

    /// Custom keys for coding/decoding `Community` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }

    /// Unique identifier for this community. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    public let id: Int

    /// Name of the community
    public let name: String

    public init (id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
