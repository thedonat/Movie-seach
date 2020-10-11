//
//  MovieDetailsTableViewCell.swift
//  MovieSearch
//
//  Created by Burak Donat on 9.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class MovieDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    @IBOutlet weak var imdbImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setView(image: String?, name: String?, overview: String?, rating: Double?, date: String?, imdb: String?) {
        movieNameLabel.text = name
        movieOverviewLabel.text = overview
        movieRatingLabel.text = "⭐️\(rating ?? 0.0)"
        movieDateLabel.text = date
        ImageLoader().loadImage(with: image, image: movieImageView)
    }
}
