//
//  ResourceLoader.swift
//  MovieSearchTests
//
//  Created by Burak Donat on 12.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation
@testable import MovieSearch

class ResourceLoader {
    
    enum MovieResource: String {
        case movie1
        case movie2
        case movie3
    }
    
    static func loadMovie(resource: MovieResource) throws -> Movie {
        let bundle = Bundle.test
        let url = try bundle.url(forResource: resource.rawValue, withExtension: "json").unwrap()
        let data = try Data(contentsOf: url)
        let movie = try JSONDecoder().decode(Movie.self, from: data)
        return movie
    }
}

private extension Bundle {
    class Dummy { }
    static let test = Bundle(for: Dummy.self)
}
