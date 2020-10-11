//
//  SimilarMoviesTableViewCell.swift
//  MovieSearch
//
//  Created by Burak Donat on 9.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

protocol SimilarMoviesTableViewCellDelegate: class {
    func cellTapped(with id: Int)
}

class SimilarMoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate: SimilarMoviesTableViewCellDelegate?
    
    var movies: [Movie] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "SimilarMoviesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SimilarMovies")
        setItemSize()
    }
    
    func setItemSize() {
        let width = (self.frame.width-20)/3
        let height = (self.frame.width-20)/2
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: height)
    }
}

extension SimilarMoviesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "SimilarMovies", for: indexPath) as! SimilarMoviesCollectionViewCell
        let movie = movies[indexPath.row]
        cell.setView(image: movie.image ?? "", name: movie.title, date: movie.releaseDate)
        return cell
    }
}

extension SimilarMoviesTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieID = movies[indexPath.row].id
        self.delegate?.cellTapped(with: movieID)
    }
}
