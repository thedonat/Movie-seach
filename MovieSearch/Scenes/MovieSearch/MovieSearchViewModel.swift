//
//  MovieSearchViewModel.swift
//  MovieSearch
//
//  Created by Burak Donat on 9.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

final class MovieSearchViewModel: MovieSearchViewModelProtocol {

    var delegate: MovieSearchViewModelDelegate?
    private let service: NetworkManagerProtocol
    private var nowPlayinMovies: [Movie] = []
    private var upcomingMovies: [Movie] = []
    private var searchMovies: [Movie] = []

    init(service: NetworkManagerProtocol) {
        self.service = service
    }
    
    func loadNowPlaying() {
        service.fetchMovies(type: .NowPlayingMovies) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.nowPlayinMovies = response.results
                self.delegate?.handleViewModelOutput(.showNowPlayingMovies(response.results))
            case .failure(let error):
                print(error.errorMessage)
            }
        }
    }
    
    func loadUpcoming() {
        service.fetchMovies(type: .UpcomingMovies) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.upcomingMovies = response.results
                self.delegate?.handleViewModelOutput(.showUpcomingMovies(response.results))
            case .failure(let error):
                print(error.errorMessage)
            }
        }
    }
    
    func loadSearch(with query: String) {
        service.searchMovies(query: query) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.searchMovies = response.results
                self.delegate?.handleViewModelOutput(.showSearchResults(response.results))
            case .failure(let error):
                print(error.errorMessage)
            }
        }
    }
    
    func selectMovie(with movieID: Int) {
        let viewModel = MovieDetailViewModel(id: movieID)
        delegate?.navigate(to: .detail(viewModel))
    }
}

