//
//  MatchEntity+Mappable.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 15/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

extension MatchEntity: MappableEntity {
    enum CodingKeys: String, CodingKey {
        case typedValue
        case integerArray
        case wasFound
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        typedValue = try values.decode(Int.self, forKey: .typedValue)
        integerArray = try values.decode([Int].self, forKey: .integerArray)
        wasFound = try values.decode(Bool.self, forKey: .wasFound)
    }
}
