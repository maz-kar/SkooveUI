//
//  PreviewProvider.swift
//  SkooveChallenge
//
//  Created by Maziar Layeghkar on 11.05.24.
//

import Foundation
import SwiftUI

//A reusable class which will can be used for all of our previews.   
extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let song = Song(
        name: "Moonlight Sonata",
        artist: "Ludwig Van Beethoven",
        level: "3",
        tileImage: "https://skoove-assets.skoove.com/lessoncontent/a5406527-4eba-4de8-915d-974a2b9da60e.jpg",
        isPremium: true
    )
    
}
