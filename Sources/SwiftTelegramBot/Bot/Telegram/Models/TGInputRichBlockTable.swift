// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A table, corresponding to the HTML tag <table>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockTable](https://core.telegram.org/bots/api#inputrichblocktable)
 **/
public final class TGInputRichBlockTable: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockTable` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case cells = "cells"
        case isBordered = "is_bordered"
        case isStriped = "is_striped"
        case caption = "caption"
    }

    /// Type of the block, always “table”
    public let type: TGInputRichBlockTableType

    /// Cells of the table
    public let cells: [[TGRichBlockTableCell]]

    /// Optional. Pass True if the table has borders
    public let isBordered: Bool?

    /// Optional. Pass True if the table is striped
    public let isStriped: Bool?

    /// Optional. Caption of the table
    public let caption: TGRichText?

    public init (type: TGInputRichBlockTableType, cells: [[TGRichBlockTableCell]], isBordered: Bool? = nil, isStriped: Bool? = nil, caption: TGRichText? = nil) {
        self.type = type
        self.cells = cells
        self.isBordered = isBordered
        self.isStriped = isStriped
        self.caption = caption
    }
}
