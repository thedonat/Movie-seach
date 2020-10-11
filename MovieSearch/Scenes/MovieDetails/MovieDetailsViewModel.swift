//
//  MovieDetailsViewModel.swift
//  MovieSearch
//
//  Created by Burak Donat on 9.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit
import Foundation

final class MovieDetailViewModel: MovieDetailsViewModelProtocol {

    weak var delegate: MovieDetailsViewModelDelegate?
    private let service =  NetworkManager()
    private var movieDetails: MovieDetailsResponse!
    private var similarMovies: [Movie] = []
    private var movieID: Int
    
    init(id: Int) {
        self.movieID = id
    }

    func loadDetails(id: Int?) {
        if let id = id {
            self.movieID = id
        }
        service.fetchDetails(id: movieID) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let response):
                self.movieDetails = response
                self.delegate?.handleViewModelOutput(.showMovieDetails(self.movieDetails))
            case .failure(let error):
                print(error.errorMessage)
            }
        }
    }
    
    func loadSimilarMovies(id: Int?) {
        if let id = id {
            self.movieID = id
        }
        service.fetchSimilarMovies(id: movieID) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.similarMovies = response.results
                self.delegate?.handleViewModelOutput(.showSimilarMovies(self.similarMovies))
            case .failure(let error):
                print(error.errorMessage)
            }
        }
    }

    func loadImdbPage(id: String) {
        let url = K.BASE_IMDB + "\(id)"
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
}
