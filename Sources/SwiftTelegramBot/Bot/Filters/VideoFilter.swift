//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Messages that contain `Video`
public class VideoFilter: TGFilter {

    public var name: String = "video"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.video != nil
    }
}

public extension TGFilter {
    static var video: VideoFilter { VideoFilter() }
}
