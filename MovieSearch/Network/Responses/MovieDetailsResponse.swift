//
//  MovieDetails.swift
//  MovieSearch
//
//  Created by Burak Donat on 9.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

public struct MovieDetailsResponse: Decodable {
    let title: String
    let backdrop_path: String
    let overview: String
    let imdb_id: String
    let vote_average: Double
    let release_date: String
}
