//  Copyright © 2024 Learnfield GmbH. All rights reserved.

import SwiftUI
import Combine

struct SongListView: View {
    @ObservedObject var viewModel: SongListViewModel

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.songs, id: \.name) { song in
                    NavigationLink(destination: SongDetailView(viewModel: SongDetailViewModel(song: song))) {
                        SongRowView(song: song)
                    }
                }
                .onAppear() {
                    viewModel.onAppear()
                }
            }
            .navigationTitle("Songs")
        }
    }
}

#Preview {
    SongListView(viewModel: SongListViewModel())
}
