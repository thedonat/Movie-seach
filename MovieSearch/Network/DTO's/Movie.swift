//
//  Movie.swift
//  MovieSearch
//
//  Created by Burak Donat on 9.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

public struct Movie: Decodable {
    let image: String
    let id: Int
    let title: String
    let releaseDate: String
    let overview: String
    
    public enum CodingKeys: String, CodingKey {
        case image = "poster_path"
        case id
        case title
        case releaseDate = "release_date"
        case overview
    }
}
