//
//  HistoryViewModel+Mappable.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 15/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

extension HistoryViewModel: MappableViewModel {
    typealias Model = MatchModel
    
    init(mapping model: MatchModel) {
        number = "\(model.typedValue)"
        status = model.wasFound ?
            R.string.localizable.found():
            R.string.localizable.notFound()
        sequence = model.integerArray
    }
}
