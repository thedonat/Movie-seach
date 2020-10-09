//
//  UpcomingTableViewCell.swift
//  MovieSearch
//
//  Created by Burak Donat on 9.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class UpcomingTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setView(image: String, name: String, overview: String, date: String) {
        movieNameLabel.text = name
        movieOverviewLabel.text = overview
        movieDateLabel.text = date
        ImageLoader().loadImage(with: image, image: movieImageView)
    }
}
