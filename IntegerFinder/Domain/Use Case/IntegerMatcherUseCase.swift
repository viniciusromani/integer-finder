//
//  IntegerMatcherUseCase.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 14/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

struct IntegerMatcherArrayUseCase {
    
    func int(_ intValue: Int, matchesInSequence integerArray: [Int]) -> Bool {
        var intResult: Int?
        var wasFound: Bool = false
        
        for (index, value) in integerArray.enumerated() {
            var sums = integerArray.map { $0 + value }
            sums.remove(at: index)
            intResult = sums.filter { $0 == intValue }.first
            wasFound = intResult != nil
            if wasFound { break }
        }
        
        return wasFound
    }
}
