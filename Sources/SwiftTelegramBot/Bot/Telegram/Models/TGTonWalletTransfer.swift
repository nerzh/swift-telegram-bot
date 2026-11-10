// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a service message about a transfer with a TON wallet.

 SeeAlso Telegram Bot API Reference:
 [TonWalletTransfer](https://core.telegram.org/bots/api#tonwallettransfer)
 **/
public final class TGTonWalletTransfer: Codable, Sendable {

    /// Custom keys for coding/decoding `TonWalletTransfer` struct
    public enum CodingKeys: String, CodingKey {
        case transactionId = "transaction_id"
        case peerAddress = "peer_address"
        case amount = "amount"
        case comment = "comment"
    }

    /// Unique identifier of the transaction; may be empty if the transfer hasn't been sent yet
    public let transactionId: String

    /// Address of the transfer peer in the TON blockchain
    public let peerAddress: String

    /// The amount of transferred cryptocurrency, in the smallest units of the cryptocurrency, as a decimal number; negative for outgoing transfers
    public let amount: String

    /// Optional. Comment added to the transfer; omitted if the comment is encrypted
    public let comment: String?

    public init (transactionId: String, peerAddress: String, amount: String, comment: String? = nil) {
        self.transactionId = transactionId
        self.peerAddress = peerAddress
        self.amount = amount
        self.comment = comment
    }
}
