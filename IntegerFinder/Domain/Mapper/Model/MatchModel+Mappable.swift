//
//  MatchModel+Mappable.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 15/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

extension MatchModel: MappableModel {
    typealias Entity = MatchEntity
    
    init(mapping entity: MatchEntity) throws {
        typedValue = entity.typedValue
        integerArray = entity.integerArray
        wasFound = entity.wasFound
    }
}
