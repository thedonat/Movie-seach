//
//  MovieSearchBuilder.swift
//  MovieSearch
//
//  Created by Burak Donat on 9.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

final class MovieListBuilder {
    
    static func make() -> MovieSearchViewController {
        let storyboard = UIStoryboard(name: "MovieSearch", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieSearch") as! MovieSearchViewController
        viewController.viewModel = MovieSearchViewModel(service: app.service)
        return viewController
    }
}
