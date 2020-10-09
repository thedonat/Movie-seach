//
//  MovieSearchViewController.swift
//  MovieSearch
//
//  Created by Burak Donat on 9.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class MovieSearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControler: UIPageControl!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    var viewModel: MovieSearchViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    private var upcomingMovieList: [Movie] = []
    private var nowPlayingMovieList: [Movie] = []
    private var searchedMovieList: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        viewModel.loadNowPlaying()
        viewModel.loadUpcoming()
        tableView.register(UINib(nibName: "UpcomingTableViewCell", bundle: nil), forCellReuseIdentifier: "UpcomingMovieCell")
        collectionView.register(UINib(nibName: "NowPlayingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NowPlayingMovieCell")
        searchTableView.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchCell")
    }
}

extension MovieSearchViewController: MovieSearchViewModelDelegate {
    func handleViewModelOutput(_ output: MovieSearchViewModelOutput) {
        switch output {
        case .showNowPlayingMovies(let movieList):
            self.upcomingMovieList = movieList
            tableView.reloadData()
        case .showUpcomingMovies(let movieList):
            self.nowPlayingMovieList = movieList
            collectionView.reloadData()
        case .showSearchResults(let movieList):
            self.searchedMovieList = movieList
            searchTableView.isHidden = false
            searchTableView.reloadData()
        }
    }
}

extension MovieSearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text else { return }
        if searchBar.text != "" {
            viewModel.loadSearch(with: text)
        } else {
            searchTableView.isHidden = true
        }
    }
}

extension MovieSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == searchTableView {
            return searchedMovieList.count
        } else {
            return upcomingMovieList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "UpcomingMovieCell", for: indexPath) as! UpcomingTableViewCell
            let movie = upcomingMovieList[indexPath.row]
            cell.setView(image: movie.image, name: movie.title, overview: movie.overview, date: movie.releaseDate)
            return cell
        }
        let cell2 = self.searchTableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchTableViewCell
        let movie = searchedMovieList[indexPath.row]
        cell2.textLabel?.text = movie.title
        return cell2
    }
    
}

extension MovieSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

extension MovieSearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nowPlayingMovieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NowPlayingMovieCell", for: indexPath) as! NowPlayingCollectionViewCell
        let movies = nowPlayingMovieList[indexPath.row]
        cell.setView(image: movies.image, title: movies.title)
        return cell
    }
}

extension MovieSearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}