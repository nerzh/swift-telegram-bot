// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a transaction with a chat.

 SeeAlso Telegram Bot API Reference:
 [TransactionPartnerChat](https://core.telegram.org/bots/api#transactionpartnerchat)
 **/
public final class TGTransactionPartnerChat: Codable, Sendable {

    /// Custom keys for coding/decoding `TransactionPartnerChat` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case chat = "chat"
        case gift = "gift"
    }

    /// Type of the transaction partner, always “chat”
    public let type: TGTransactionPartnerChatType

    /// Information about the chat
    public let chat: TGChat

    /// Optional. The gift sent to the chat by the bot
    public let gift: TGGift?

    public init (type: TGTransactionPartnerChatType, chat: TGChat, gift: TGGift? = nil) {
        self.type = type
        self.chat = chat
        self.gift = gift
    }
}
