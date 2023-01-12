// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Describes data required for decrypting and authenticating EncryptedPassportElement. See the Telegram Passport Documentation for a complete description of the data decryption and authentication processes.

 SeeAlso Telegram Bot API Reference:
 [EncryptedCredentials](https://core.telegram.org/bots/api#encryptedcredentials)
 */
public final class TGEncryptedCredentials: Codable {

    /// Custom keys for coding/decoding `EncryptedCredentials` struct
    public enum CodingKeys: String, CodingKey {
        case data = "data"
        case hash = "hash"
        case secret = "secret"
    }

    /// Base64-encoded encrypted JSON-serialized data with unique user's payload, data hashes and secrets required for EncryptedPassportElement decryption and authentication
    public var data: String

    /// Base64-encoded data hash for data authentication
    public var hash: String

    /// Base64-encoded secret, encrypted with the bot's public RSA key, required for data decryption
    public var secret: String

    public init (data: String, hash: String, secret: String) {
        self.data = data
        self.hash = hash
        self.secret = secret
    }
}
