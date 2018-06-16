//
//  IntParse.swift
//  IntegerFinderTests
//
//  Created by Vinicius Romani on 16/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import XCTest
import Nimble
import Moya
import RxSwift
@testable import IntegerFinder

class IntParse: XCTestCase {
    
    var _localJSON: String = ""
    
    func testMapIntArray() {
        
        let observable = Observable.of(response)
        expect(observable).first.toNot(beNil())
        
        let intObservable = observable.mapEntities(Int.self)
        expect(intObservable).first.toNot(beNil())
        
        do {
            let integerArray = try intObservable.toBlocking().single()
            expect(integerArray.count).to(beGreaterThan(0))
        } catch {
            fail("Could not get observable value")
        }
    }
}

extension IntParse: TestableEntityMapper {
    
    var localJSON: String {
        get { return _localJSON }
        set { _localJSON = newValue }
    }
}
