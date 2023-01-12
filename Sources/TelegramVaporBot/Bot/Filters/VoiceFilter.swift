//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Messages that contain `Voice`
public class VoiceFilter: TGFilter {

    public var name: String = "voice"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.voice != nil
    }
}

public extension TGFilter {
    static var voice: VoiceFilter { VoiceFilter() }
}
