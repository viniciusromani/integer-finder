//
//  MatcherViewModelTests.swift
//  IntegerFinderTests
//
//  Created by Vinicius Romani on 16/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import XCTest
import Nimble
@testable import IntegerFinder

class MatcherViewModelTests: XCTestCase {
    
    private let matchModel = MatchModel(typedValue: 3, integerArray: [1, 2, 3], wasFound: true)
    
    func testSuccessfulMapping() {
        let viewModel = HistoryViewModel(mapping: matchModel)
        expect(viewModel).toNot(beNil())
        
        expect(viewModel.number).to(equal("\(matchModel.typedValue)"))
        let string = matchModel.wasFound ?
            R.string.localizable.found():
            R.string.localizable.notFound()
        expect(viewModel.status).to(equal(string))
    }
}
