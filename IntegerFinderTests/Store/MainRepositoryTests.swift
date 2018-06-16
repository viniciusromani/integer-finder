//
//  MainRepositoryTests.swift
//  IntegerFinderTests
//
//  Created by Vinicius Romani on 16/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import XCTest
import Nimble
import RxNimble
@testable import IntegerFinder

class MainRepositoryTests: XCTestCase {
    
    private let repository = MainNetworkRepository()
    
    func testFetchIntegerArray() {
        let observable = repository.fetchIntegerArray()
        expect(observable).first.toNot(beNil())
    }
}
