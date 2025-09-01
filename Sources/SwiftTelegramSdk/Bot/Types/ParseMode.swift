//
//  ParseMode.swift
//  Telegrammer
//
//  Created by Givi Pataridze on 17/06/2018.
//

import Foundation

/** Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot's message.
 
 SeeAlso Telegram TGBot API Reference:
 [Formatting Options](https://core.telegram.org/bots/api#formatting-options)
 */
public enum TGParseMode: String, Codable {
    case markdownV2 = "MarkdownV2"
    @available(*, deprecated, message: "This is a legacy mode, retained for backward compatibility.", renamed: "markdownV2")
    case markdown  = "Markdown"
    case html      = "HTML"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGParseMode(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}
