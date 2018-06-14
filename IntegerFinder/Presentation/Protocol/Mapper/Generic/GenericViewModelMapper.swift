//
//  GenericViewModelMapper.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 14/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

extension MappableViewModel {
    static func array(mapping models: [Model]) -> [Self] {
        return models.map { return self.init(mapping: $0) }
    }
}
