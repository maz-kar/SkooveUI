//  Copyright © 2024 Learnfield GmbH. All rights reserved.

import Foundation

struct Song: Decodable, Hashable {
    let name: String
    let artist: String
    let level: String
    let tileImage: String
    let isPremium: Bool
}
