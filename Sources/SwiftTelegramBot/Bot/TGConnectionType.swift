//
//  Created by Oleh Hudeichuk on 19.11.2026.
//

import Foundation

public enum TGConnectionType: Sendable {
    case longpolling(
        limit: Int? = nil,
        timeout: Int? = nil,
        allowedUpdates: [TGUpdate.CodingKeys]? = nil
    )
    case webhook(webHookURL: URL)
}
