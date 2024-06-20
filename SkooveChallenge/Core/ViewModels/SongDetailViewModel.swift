//  Copyright © 2024 Learnfield GmbH. All rights reserved.

import Foundation

class SongDetailViewModel {
    private let song: Song

    required init(song: Song) {
        self.song = song
    }

    var navigationTitle: String {
        song.name
    }
    
    var songTileImage: String {
        song.tileImage
    }
}
