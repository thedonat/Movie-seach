//
//  Optional+Helpers.swift
//  MovieSearchTests
//
//  Created by Burak Donat on 12.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

public extension Optional {
    
    struct FoundNilWhileUnwrappingError: Error { }
    
    func unwrap() throws -> Wrapped {
        switch self {
        case .some(let wrapped):
            return wrapped
        case .none:
            throw FoundNilWhileUnwrappingError()
        }
    }
}
