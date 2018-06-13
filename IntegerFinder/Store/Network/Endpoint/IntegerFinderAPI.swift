//
//  IntegerFinderAPI.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 13/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Moya

enum IntegerFinderAPI {
    case fetchIntegerArray
}

// MARK: - TargetType Protocol conformance

extension IntegerFinderAPI: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("The URL could not be configured") }
        return url
    }
    
    var path: String {
        switch self {
        case .fetchIntegerArray: return "random_array_generator"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchIntegerArray: return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .fetchIntegerArray: return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

// MARK: - Enum helpers

extension IntegerFinderAPI {
    private var environmentBaseURL: String {
        let environment = NetworkSettings.environment
        switch environment {
        case .production: return "https://k9h52hczu2.execute-api.us-east-2.amazonaws.com/prod/"
        }
    }
}


