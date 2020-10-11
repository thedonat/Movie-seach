//
//  SimilarMoviesCollectionViewCell.swift
//  MovieSearch
//
//  Created by Burak Donat on 10.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class SimilarMoviesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImageView.layer.cornerRadius = 5
    }

    func setView(image: String, name: String, date: String) {
        movieNameLabel.text = name
        movieDateLabel.text = date
        ImageLoader().loadImage(with: image, image: movieImageView)
    }
}
