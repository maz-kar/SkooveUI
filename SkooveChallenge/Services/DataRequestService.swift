//  Copyright © 2024 Learnfield GmbH. All rights reserved.

import Foundation
import Combine

// Although that the data is fetched from a local source, assume for the challenge that this is a veeeeery
// time-consuming process so it might block the thread which will be executed on.
class DataRequestService {
    
    @Published var songs: [Song] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        songData()
    }
    
    private func songData() {
        let filePath = Bundle.main.path(forResource: "songs", ofType: "json")!
        let fileURL = URL(fileURLWithPath: filePath)
        URLSession.shared.dataTaskPublisher(for: fileURL)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { output in
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [Song].self, decoder: JSONDecoder())
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.handleFailure(error: .networkError(error))
                }
            }, receiveValue: { [weak self] returnedData in
                self?.songs = returnedData.sorted { $0.name < $1.name }
            })
            .store(in: &cancellables)
    }
    
    enum DataRequestError: Error {
        case networkError(Error)
        case unknown
    }
    
    private func handleFailure(error: DataRequestError) {
        switch error {
        case .networkError(let error):
            print("Network error: \(error.localizedDescription)")
        case .unknown:
            print("Unknown error occured.")
        }
    }
    
}
