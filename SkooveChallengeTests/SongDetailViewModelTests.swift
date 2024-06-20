//
//  SongDetailViewModelTests.swift
//  SkooveChallengeTests
//
//  Created by Maziar Layeghkar on 11.05.24.
//

import XCTest
@testable import SkooveChallenge

final class SongDetailViewModelTests: XCTestCase {
    
    var sut: SongDetailViewModel!
    
    override func setUp() {
        let mockSong = Song(
            name: "Test song",
            artist: "Test artist",
            level: "Test level",
            tileImage: "image.jpg",
            isPremium: true
        )
        sut = SongDetailViewModel(song: mockSong)
    }
    
    func test_navigationTitle_shouldReturnCorrectName() {
        XCTAssertEqual(sut.navigationTitle, "Test song")
    }
    
    func test_songTileImage_shouldReturnCorrectTileImage() {
        XCTAssertEqual(sut.songTileImage, "image.jpg")
    }
}
