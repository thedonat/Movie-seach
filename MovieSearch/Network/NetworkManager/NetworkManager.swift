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
    func fetchMovies(type: ListType, completion: @escaping (Result<MovieResponse, NetworkError>) -> Void)
    func searchMovies(query: String, completion: @escaping (Result<MovieResponse, NetworkError>) -> Void)
}

public class NetworkManager: NetworkManagerProtocol {
    
    func fetchMovies(type: ListType, completion: @escaping (Result<MovieResponse, NetworkError>) -> Void) {
        let endPoint = setEndPoint(type: type)
        let urlString = K.BASE_URL + endPoint.rawValue + K.API_KEY
        
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
    
    func searchMovies(query: String, completion: @escaping (Result<MovieResponse, NetworkError>) -> Void) {
        let urlString = K.SEARCH_URL + K.API_KEY + "&query=\(query)"
        print(urlString)
        
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

private func setEndPoint(type: ListType) -> EndPoints {
    var endPoint: EndPoints
    switch type {
    case .NowPlayingMovies:
        endPoint = .getNowPlaying
    case .UpcomingMovies:
        endPoint = .getUpcoming
    }
    return endPoint
}
