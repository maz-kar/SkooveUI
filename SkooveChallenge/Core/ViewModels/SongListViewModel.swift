//  Copyright © 2024 Learnfield GmbH. All rights reserved.

import Combine
import Foundation

class SongListViewModel: ObservableObject {
    @Published var songs: [Song] = []

    private var serviceProvider = DataRequestService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        onAppear()
    }

    func onAppear() {
        serviceProvider.$songs
            .sink { [weak self] returnedSongs in
                self?.songs = returnedSongs
            }
            .store(in: &cancellables)
    }
    
}
