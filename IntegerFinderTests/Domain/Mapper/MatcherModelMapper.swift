//
//  MatcherModelMapper.swift
//  IntegerFinderTests
//
//  Created by Vinicius Romani on 16/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import XCTest
import Nimble
@testable import IntegerFinder

class MatcherModelMapper: XCTestCase {
    
    private let entity1 = MatchEntity(typedValue: 32, integerArray: [2, 3, 4], wasFound: true)
    private let entity2 = MatchEntity(typedValue: 2, integerArray: [2, 3, 4], wasFound: true)
    
    func testMatchModelMapper() {
        do {
            let matchModel = try MatchModel(mapping: entity1)
            expect(matchModel).toNot(beNil())
            expect(matchModel.typedValue).to(equal(entity1.typedValue))
            expect(matchModel.integerArray).to(equal(entity1.integerArray))
            expect(matchModel.wasFound).to(equal(entity1.wasFound))
        } catch {
            fail("Could not map entity to model")
        }
    }
    
    func testMatchModelArrayMapper() {
        do {
            let matchModelArray = try MatchModel.array(mapping: [entity1, entity2])
            expect(matchModelArray).toNot(beNil())
            expect(matchModelArray.count).to(equal(2))
            
            expect(matchModelArray.first).toNot(beNil())
            expect(matchModelArray.first?.typedValue).to(equal(entity1.typedValue))
            expect(matchModelArray.first?.integerArray).to(equal(entity1.integerArray))
            expect(matchModelArray.first?.wasFound).to(equal(entity1.wasFound))
            
            expect(matchModelArray.last).toNot(beNil())
            expect(matchModelArray.last?.typedValue).to(equal(entity2.typedValue))
            expect(matchModelArray.last?.integerArray).to(equal(entity2.integerArray))
            expect(matchModelArray.last?.wasFound).to(equal(entity2.wasFound))
        } catch {
            fail("Could not map entity to model")
        }
    }
}
