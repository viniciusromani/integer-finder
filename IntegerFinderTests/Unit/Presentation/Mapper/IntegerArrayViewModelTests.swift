//
//  IntegerArrayViewModelTests.swift
//  IntegerFinderTests
//
//  Created by Vinicius Romani on 16/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import XCTest
import Nimble
@testable import IntegerFinder

class IntegerArrayViewModelTests: XCTestCase {
    
    private let sequence = [66, -30, 58, 70, 91, 19, -7, -37, 37, 3, -42, -77, 47, -24, -52, -57]
    
    func testSuccessfulMapping() {
        let viewModel = IntegerArrayViewModel.array(mapping: sequence)
        expect(viewModel).toNot(beNil())
        expect(viewModel.count).to(equal(sequence.count))
        
        for (index, element) in viewModel.enumerated() {
            let string = "\(sequence[index])"
            expect(string).to(equal(element.number))
        }
    }
}
