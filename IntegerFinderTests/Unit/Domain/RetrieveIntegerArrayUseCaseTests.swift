//
//  RetrieveIntegerArrayUseCaseTests.swift
//  IntegerFinderTests
//
//  Created by Vinicius Romani on 16/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import XCTest
import Nimble
@testable import IntegerFinder

class RetrieveIntegerArrayUseCaseTests: XCTestCase {
    
    private let useCase = RetrieveIntegerArrayUseCase(repository: MainNetworkRepository())
    
    func testFetchArray() {
        let observable = useCase.retrieveIntegerArray()
        expect(observable).notTo(beNil())
        
        do {
            let integerArray = try observable.toBlocking().single()
            expect(integerArray.count).to(beGreaterThan(0))
        } catch {
            fail("Could not get observable value")
        }
    }
}
