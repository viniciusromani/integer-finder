//
//  NetworkSettings.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 13/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

enum APIEnvironment {
    case production
}

struct NetworkSettings {
    static let environment: APIEnvironment = .production
}
