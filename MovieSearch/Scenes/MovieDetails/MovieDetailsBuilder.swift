//
//  MovieDetailsBuilder.swift
//  MovieSearch
//
//  Created by Burak Donat on 9.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

final class MovieDetailsBuilder {
    
    static func make(with viewModel: MovieDetailsViewModelProtocol) -> MovieDetailsViewController {
        let storyboard = UIStoryboard(name: "MovieDetails", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetail") as! MovieDetailsViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
