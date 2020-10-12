//
//  MovieSearchTests.swift
//  MovieSearchTests
//
//  Created by Burak Donat on 12.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import XCTest
@testable import MovieSearch

class MovieSearchTests: XCTestCase {
    
    private var view: MockView!
    private var viewModel: MovieSearchViewModel!
    private var service: MockNetorkManager!
    
    override func setUp() {
        service = MockNetorkManager()
        viewModel = MovieSearchViewModel(service: service)
        view = MockView()
        viewModel.delegate = view
     }
    
    func testParsing() throws {
        
        let movie = try ResourceLoader.loadMovie(resource: .movie1)
        
        XCTAssertEqual(movie.title, "Mulan")
        XCTAssertEqual(movie.id, 337401)
        XCTAssertEqual(movie.releaseDate, "2020-09-04")
        XCTAssertEqual(movie.image, "/aKx1ARwG55zZ0GpRvU2WrGrCG9o.jpg")
  }
    
    func testLoad() throws {
         // Given:
         let movie1 = try ResourceLoader.loadMovie(resource: .movie1)
         let movie2 = try ResourceLoader.loadMovie(resource: .movie2)
         let movie3 = try ResourceLoader.loadMovie(resource: .movie2)
         service.movies = [movie1, movie2, movie3]
         
         // When:
         viewModel.loadNowPlaying()
         
         // Then:
         XCTAssertEqual(view.outputs.count, 1)
        
        switch try view.outputs.element(at: 0) {
        case .showNowPlayingMovies(_):
            break // Success!
        default:
            XCTFail("Output should be `showNowPlayingMovies`")
        }
        
        let expectedMovies = [movie1,movie2,movie3].map({ MovieResponse(results: <#T##[Movie]#>)   })
        XCTAssertEqual(try view.outputs.element(at: 0), .showNowPlayingMovies(expectedMovies) )

     }
    
    func testNavigation() throws {
        // Given:
        let movie1 = try ResourceLoader.loadMovie(resource: .movie1)
        let movie2 = try ResourceLoader.loadMovie(resource: .movie2)
        let movie3 = try ResourceLoader.loadMovie(resource: .movie2)
        service.movies = [movie1, movie2, movie3]
        viewModel.loadNowPlaying()
        view.reset()
        
        // When:
        viewModel.selectMovie(with: 337401)
        
        // Then:
        XCTAssertTrue(view.detailRouteCalled)
    }
}


private class MockView: MovieSearchViewModelDelegate{
    
    var outputs: [MovieSearchViewModelOutput] = []
    var detailRouteCalled: Bool = false
    
    func reset() {
        outputs.removeAll()
        detailRouteCalled = false
    }
    
    func handleViewModelOutput(_ output: MovieSearchViewModelOutput) {
        outputs.append(output)
    }
    
    func navigate(to route: MovieListViewRoute) {
        switch route {
        case .detail:
            detailRouteCalled = true
        }
    }
}
