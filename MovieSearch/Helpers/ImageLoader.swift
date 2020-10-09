//
//  ImageLoader.swift
//  MovieSearch
//
//  Created by Burak Donat on 9.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation
import Kingfisher

struct ImageLoader {
    func loadImage(with endpoint: String?, image: UIImageView) {
        if let endpoint = endpoint {
            let url = URL(string: K.IMAGE_URL + endpoint)
            image.kf.setImage(with: url, placeholder: UIImage(named: "movie"))
        }
    }
}
