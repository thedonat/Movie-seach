//
//  Array+Helpers.swift
//  MovieSearchTests
//
//  Created by Burak Donat on 12.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

public extension Array {
    
    struct IndexOutOfBoundsError: Error { }
    
    func element(at index: Int) throws -> Element {
        guard index >= 0 && index < self.count else {
            throw IndexOutOfBoundsError()
        }
        return self[index]
    }
}
