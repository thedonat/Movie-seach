//
//  MovieDetailsContracts.swift
//  MovieSearch
//
//  Created by Burak Donat on 9.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

protocol MovieDetailsViewModelProtocol {
    var delegate: MovieDetailsViewModelDelegate? { get set }
    func loadDetails(id: Int?)
    func loadSimilarMovies(id: Int?)
}

protocol MovieDetailsViewModelDelegate: class {
    func handleViewModelOutput(_ output: MovieDetailsViewModelOutput)
}

enum MovieDetailsViewModelOutput{
    case showMovieDetails(MovieDetailsResponse)
    case showSimilarMovies([Movie])
}
