//
//  SongRowView.swift
//  SkooveChallenge
//
//  Created by Maziar Layeghkar on 11.05.24.
//

import SwiftUI

struct SongRowView: View {
    let song: Song
    
    var body: some View {
        HStack(spacing: 0) {
            songTileImage
                .padding()
            songTextualData
        }
    }
}

struct SongRowView_Previews: PreviewProvider {
    static var previews: some View {
        SongRowView(song: dev.song)
    }
}

extension SongRowView {
    
    private var songTileImage: some View {
        AsyncImage(url: URL(string: song.tileImage)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
        } placeholder: {
            Circle()
                .foregroundStyle(Color.gray)
        }
        .frame(width: 100, height: 100)
    }
    
    private var songTextualData: some View {
        VStack(alignment: .leading) {
            Text(song.name)
                .font(.title2)
                .fontWeight(.medium)
            
            Text(song.artist)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundStyle(Color.gray)
            
            HStack {
                Text("Level \(song.level)")
                    .font(.body)
                    .foregroundStyle(Color.gray)
                
                if song.isPremium {
                    Image(systemName: "suit.diamond.fill")
                        .foregroundColor(Color.yellow)
                }
            }
        }
    }
}
