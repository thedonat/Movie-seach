//
//  MockNetworkManager.swift
//  MovieSearchTests
//
//  Created by Burak Donat on 12.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation
@testable import MovieSearch

final class MockNetorkManager: NetworkManagerProtocol {
    
    var movies: [Movie] = []

    func fetchMovies(type: ListType, completion: @escaping (Result<MovieResponse, ErrorManager>) -> Void) {
        completion(.success(MovieResponse(results: movies)))
    }
    
    func searchMovies(query: String, completion: @escaping (Result<MovieResponse, ErrorManager>) -> Void) {
        completion(.success(MovieResponse(results: movies)))
    }
}
