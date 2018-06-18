//
//  IntegerValidatorUseCaseTests.swift
//  IntegerFinderTests
//
//  Created by Vinicius Romani on 18/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import XCTest
import Nimble
@testable import IntegerFinder

class IntegerValidatorUseCaseTests: XCTestCase {
    
    private let useCase = IntegerValidatorUseCase()
    
    func testValidNumber() {
        var number = 36
        var result = useCase.validate(int: number)
        expect(result).to(beTrue())
        
        number = -197
        result = useCase.validate(int: number)
        expect(result).to(beTrue())
        
        number = -196
        result = useCase.validate(int: number)
        expect(result).to(beTrue())
        
        number = 197
        result = useCase.validate(int: number)
        expect(result).to(beTrue())
        
        number = 196
        result = useCase.validate(int: number)
        expect(result).to(beTrue())
    }

    func testInvalidNumber() {
        var number = 200
        var result = useCase.validate(int: number)
        expect(result).to(beFalse())
        
        number = -198
        result = useCase.validate(int: number)
        expect(result).to(beFalse())
        
        number = 198
        result = useCase.validate(int: number)
        expect(result).to(beFalse())
    }
}
