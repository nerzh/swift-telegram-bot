// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Cell in a table.

 SeeAlso Telegram Bot API Reference:
 [RichBlockTableCell](https://core.telegram.org/bots/api#richblocktablecell)
 **/
public final class TGRichBlockTableCell: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockTableCell` struct
    public enum CodingKeys: String, CodingKey {
        case text = "text"
        case isHeader = "is_header"
        case colspan = "colspan"
        case rowspan = "rowspan"
        case align = "align"
        case valign = "valign"
    }

    /// Optional. Text in the cell. If omitted, then the cell is invisible.
    public let text: TGRichText?

    /// Optional. True, if the cell is a header cell
    public let isHeader: Bool?

    /// Optional. The number of columns the cell spans if it is bigger than 1
    public let colspan: Int?

    /// Optional. The number of rows the cell spans if it is bigger than 1
    public let rowspan: Int?

    /// Horizontal cell content alignment. Currently, must be one of “left”, “center”, or “right”.
    public let align: String

    /// Vertical cell content alignment. Currently, must be one of “top”, “middle”, or “bottom”.
    public let valign: String

    public init (text: TGRichText? = nil, isHeader: Bool? = nil, colspan: Int? = nil, rowspan: Int? = nil, align: String, valign: String) {
        self.text = text
        self.isHeader = isHeader
        self.colspan = colspan
        self.rowspan = rowspan
        self.align = align
        self.valign = valign
    }
}
