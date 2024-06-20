//  Copyright © 2024 Learnfield GmbH. All rights reserved.

import SwiftUI

@main
struct SkooveChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            SongListView(viewModel: SongListViewModel())
        }
    }
}
