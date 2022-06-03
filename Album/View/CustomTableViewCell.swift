//
//  CustomTableViewCell.swift
//  Album
//
//  Created by apple on 6/2/22.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit
import SDWebImage

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    
    @IBOutlet weak var albumImg: UIImageView!
    @IBOutlet weak var cardView: CardView!
    
    var albumViewModel: AlbumViewModel! {
        didSet {
            guard let artist = albumViewModel.artistName else {
                return
            }
            guard let fileurl = URL(string: albumViewModel.artworkUrl100 ?? "") else {
                return
            }
            guard let track = albumViewModel.trackName else {
                return
            }
            artistLabel.text = "Artist: \(artist)"
            trackLabel.text = "Track: \(track)"
            albumImg.sd_setImage(with: fileurl, placeholderImage: UIImage(named: "thsirt"))
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
