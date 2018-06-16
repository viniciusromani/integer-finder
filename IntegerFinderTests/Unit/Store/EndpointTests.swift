//
//  EndpointTests.swift
//  IntegerFinderTests
//
//  Created by Vinicius Romani on 16/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import XCTest
import Nimble
import Moya
@testable import IntegerFinder

class EndpointTests: XCTestCase {
    
    private var endpoint: IntegerFinderAPI!
    
    func testProtocolConformance() {
        expect(self.endpoint as? TargetType).toNot(beNil())
    }
    
    func testFetchArrayEndpoint() {
        endpoint = .fetchIntegerArray
        
        testProtocolConformance()
        
        // Base URL
        let url = URL(string: "https://k9h52hczu2.execute-api.us-east-2.amazonaws.com/prod/")!
        expect(self.endpoint.baseURL == url).to(beTrue())
        
        // Path
        let path = "random_array_generator"
        expect(self.endpoint.path == path).to(beTrue())
        
        // Headers
        expect(self.endpoint.headers).to(beNil())
    }
}
