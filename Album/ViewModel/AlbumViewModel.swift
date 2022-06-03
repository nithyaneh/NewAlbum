//
//  AlbumViewModel.swift
//  Album
//
//  Created by apple on 6/2/22.
//  Copyright © 2022 apple. All rights reserved.
//

import Foundation

class AlbumViewModel {

    var artistName: String?
    var trackName: String?
    var artworkUrl100: String?
    
   // Dependency Injection
    
    init(album:AlbumModel){
        self.artistName = album.artistName
        self.trackName = album.trackName
        self.artworkUrl100 = album.artworkUrl100
    }
    
}
