// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains information about changes to a user payment subscription toward the current bot.

 SeeAlso Telegram Bot API Reference:
 [BotSubscriptionUpdated](https://core.telegram.org/bots/api#botsubscriptionupdated)
 **/
public final class TGBotSubscriptionUpdated: Codable, Sendable {

    /// Custom keys for coding/decoding `BotSubscriptionUpdated` struct
    public enum CodingKeys: String, CodingKey {
        case user = "user"
        case invoicePayload = "invoice_payload"
        case state = "state"
    }

    /// User who subscribed for payments toward the bot
    public let user: TGUser

    /// Bot-specified invoice payload
    public let invoicePayload: String

    /// The new state of the subscription. Currently, it can be one of “canceled” if the user canceled the subscription, “active” if the user re-enabled a previously canceled subscription, or “failed” if payment for the subscription failed.
    public let state: String

    public init (user: TGUser, invoicePayload: String, state: String) {
        self.user = user
        self.invoicePayload = invoicePayload
        self.state = state
    }
}
