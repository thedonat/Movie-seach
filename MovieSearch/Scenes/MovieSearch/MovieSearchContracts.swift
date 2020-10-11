//
//  MovieSearchContracts.swift
//  MovieSearch
//
//  Created by Burak Donat on 9.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

protocol MovieSearchViewModelProtocol {
    var delegate: MovieSearchViewModelDelegate? { get set }
    func loadNowPlaying()
    func loadUpcoming()
    func loadSearch(with query: String)
    func selectMovie(with id: Int)
}

protocol MovieSearchViewModelDelegate: class {
    func handleViewModelOutput(_ output: MovieSearchViewModelOutput)
    func navigate(to route: MovieListViewRoute)
}

enum MovieSearchViewModelOutput{
    case showNowPlayingMovies([Movie])
    case showUpcomingMovies([Movie])
    case showSearchResults([Movie])
}

enum MovieListViewRoute {
    case detail(MovieDetailsViewModelProtocol)
}
