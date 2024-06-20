//  Copyright © 2024 Learnfield GmbH. All rights reserved.

import SwiftUI

//This view has its best performance in portrait mode on simulator or real device 
struct SongDetailView: View {
    let viewModel: SongDetailViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                songName
                    .padding(.top, -50)
                fullScreenImage
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SongDetailView(viewModel: SongDetailViewModel(song: dev.song))
    }
}

extension SongDetailView {
    
    private var songName: some View {
        HStack(alignment: .top) {
            Text(viewModel.navigationTitle)
                .font(.largeTitle)
                .bold()
                .padding(.leading)
            Spacer()
        }
    }
    
    private var fullScreenImage: some View {
        AsyncImage(url: URL(string: viewModel.songTileImage)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .clipShape(Rectangle())
        } placeholder: {
            Rectangle()
                .foregroundStyle(Color.gray)
        }
    }
    
}
