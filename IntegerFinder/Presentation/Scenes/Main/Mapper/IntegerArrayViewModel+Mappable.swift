//
//  IntegerArrayViewModel+Mappable.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 14/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

extension IntegerArrayViewModel: MappableViewModel {
    
    typealias Model = Int
    
    init(mapping model: Int) {
        number = "\(model)"
    }
}
