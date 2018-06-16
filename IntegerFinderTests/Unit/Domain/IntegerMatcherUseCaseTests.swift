//
//  IntegerMatcherUseCaseTests.swift
//  IntegerFinderTests
//
//  Created by Vinicius Romani on 16/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import XCTest
import Nimble
@testable import IntegerFinder

class IntegerMatcherUseCaseTests: XCTestCase {
    
    private let useCase = IntegerMatcherArrayUseCase()
    private let sequence = [66, -30, 58, 70, 91, 19, -7, -37, 37, 3, -42, -77, 47, -24, -52, -57]
    
    func testValidMatch() {
        var number = 36
        var result = useCase.int(number, matchesInSequence: sequence)
        expect(result).to(beTrue())
        
        number = 117
        result = useCase.int(number, matchesInSequence: sequence)
        expect(result).to(beTrue())
        
        number = -44
        result = useCase.int(number, matchesInSequence: sequence)
        expect(result).to(beTrue())
    }
    
    func testInvalidMatch() {
        var number = 102
        var result = useCase.int(number, matchesInSequence: sequence)
        expect(result).to(beFalse())
        
        number = -13
        result = useCase.int(number, matchesInSequence: sequence)
        expect(result).to(beFalse())
        
        number = -63
        result = useCase.int(number, matchesInSequence: sequence)
        expect(result).to(beFalse())
    }
}
