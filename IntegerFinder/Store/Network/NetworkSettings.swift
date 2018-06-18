//
//  NetworkSettings.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 13/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Alamofire

enum APIEnvironment {
    case production
}

struct NetworkSettings {
    static let environment: APIEnvironment = .production
    
    static let requestManager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 20
        return Alamofire.SessionManager(configuration: configuration)
    }()
}
