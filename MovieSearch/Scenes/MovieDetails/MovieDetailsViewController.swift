//
//  MovieDetailsViewController.swift
//  MovieSearch
//
//  Created by Burak Donat on 9.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: MovieDetailsViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    private var movieDetails: MovieDetailsResponse! {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var similarMovies: [Movie] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadDetails(id: nil)
        viewModel.loadSimilarMovies(id: nil)
        tableView.register(UINib(nibName: "MovieDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieDetails")
        tableView.register(UINib(nibName: "SimilarMoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "SimilarMovies")
    }
}

extension MovieDetailsViewController: MovieDetailsViewModelDelegate {
    func handleViewModelOutput(_ output: MovieDetailsViewModelOutput) {
        
        switch output {
        case .showMovieDetails(let details):
            self.movieDetails = details
        case .showSimilarMovies(let movies):
            self.similarMovies = movies
        }
    }
}

extension MovieDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "MovieDetails", for: indexPath) as! MovieDetailsTableViewCell
            let movie = self.movieDetails
            cell.setView(image: movie?.backdrop_path,
                         name: movie?.title,
                         overview: movie?.overview,
                         rating: movie?.vote_average,
                         date: movie?.release_date,
                         imdb: movie?.imdb_id)
            return cell
        } else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "SimilarMovies", for: indexPath) as! SimilarMoviesTableViewCell
            cell.movies = self.similarMovies
            cell.delegate = self
            return cell
        }
    }
}

extension MovieDetailsViewController: SimilarMoviesTableViewCellDelegate {
    func cellTapped(with id: Int) {
        viewModel.loadDetails(id: id)
        viewModel.loadSimilarMovies(id: id)
    }
}
