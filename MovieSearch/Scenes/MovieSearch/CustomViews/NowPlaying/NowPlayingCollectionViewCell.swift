//
//  NowPlayingCollectionViewCell.swift
//  MovieSearch
//
//  Created by Burak Donat on 9.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setView(image: String, title: String) {
        movieTitleLabel.text = title
        ImageLoader().loadImage(with: image, image: movieImageView)
    }
}
