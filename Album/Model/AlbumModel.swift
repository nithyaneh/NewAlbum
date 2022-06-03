//
//  AlbumModel.swift
//  Album
//
//  Created by apple on 6/2/22.
//  Copyright © 2022 apple. All rights reserved.
//

import Foundation
import UIKit

struct AlbumModel: Decodable {
    var artistName: String?
    var trackName: String?
    var artworkUrl100 : String?
}

struct ResultsModel: Decodable {
    var results = [AlbumModel]()
}
