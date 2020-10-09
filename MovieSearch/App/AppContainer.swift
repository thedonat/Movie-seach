//
//  AppContainer.swift
//  MovieSearch
//
//  Created by Burak Donat on 9.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

let app = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let service = NetworkManager()
}
