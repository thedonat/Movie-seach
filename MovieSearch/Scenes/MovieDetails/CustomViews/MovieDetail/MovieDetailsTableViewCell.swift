//
//  MovieDetailsTableViewCell.swift
//  MovieSearch
//
//  Created by Burak Donat on 9.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

protocol MovieDetailsTableViewCellDelegate: class {
    func imdbButtonTapped(with imdbID: String)
}

class MovieDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    @IBOutlet weak var imdbButton: UIButton!
    weak var delegate: MovieDetailsTableViewCellDelegate?
    private var imdbID: String?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setView(image: String?, name: String?, overview: String?, rating: Double?, date: String?, imdb: String?) {
        movieNameLabel.text = name
        movieOverviewLabel.text = overview
        movieRatingLabel.text = "⭐️\(rating ?? 0.0)"
        movieDateLabel.text = date
        imdbID = imdb
        ImageLoader().loadImage(with: image, image: movieImageView)
    }
    
    @IBAction func imdbButtonTapped(_ sender: UIButton) {
        if let imdbID = imdbID {
            self.delegate?.imdbButtonTapped(with: imdbID)
        }
    }
}
