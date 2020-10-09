//
//  NetworkManager.swift
//  MovieSearch
//
//  Created by Burak Donat on 9.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    func fetchMovies(completion: @escaping (Result<MovieResponse, NetworkError>) -> Void)
}

public class NetworkManager: NetworkManagerProtocol {
    func fetchMovies(completion: @escaping (Result<MovieResponse, NetworkError>) -> Void) {
        let urlString = "https://api.themoviedb.org/3/movie/now_playing?api_key=f19243dec008358a10b071e605df2743"
        
        AF.request(urlString).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(.decoding))
                }
            case .failure:
                completion(.failure(.network))
            }
        }
    }
}
