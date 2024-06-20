//
//  DataRequestServiceTests.swift
//  SkooveChallengeTests
//
//  Created by Maziar Layeghkar on 11.05.24.
//

import XCTest
import Combine
@testable import SkooveChallenge

class DataRequestServiceTests: XCTestCase {
    var sut: DataRequestService!
    var called: XCTestExpectation!
    
    override func setUp() {
        super.setUp()
        called = XCTestExpectation()
        sut = DataRequestService()
    }
    
    func test_songData_shouldFetchSongsFromDisk() throws {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertTrue(self.sut.songs.count > 0)
            self.called.fulfill()
        }
        
        wait(for: [called], timeout: 2.0)
    }
    
    func test_songData_shouldDecodeSongsCorrectly() throws {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let firstSong = self.sut.songs[0]
            XCTAssertFalse(firstSong.name.isEmpty)
            XCTAssertFalse(firstSong.artist.isEmpty)
            XCTAssertFalse(firstSong.level.isEmpty)
            XCTAssertFalse(firstSong.tileImage.isEmpty)
            XCTAssertNotNil(firstSong.isPremium)
            
            self.called.fulfill()
        }
        
        wait(for: [called], timeout: 2.0)
    }
    
}
