//
//  MovieResponse.swift
//  MovieSearch
//
//  Created by Burak Donat on 9.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

public struct MovieResponse: Decodable {
    
    private enum FeedCodingKeys: String, CodingKey {
        case results
    }
    
    public let results: [Movie]
    
    init(results: [Movie]) {
        self.results = results
    }
    
    public init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: FeedCodingKeys.self)
        self.results = try rootContainer.decode([Movie].self, forKey: .results)
    }
}
