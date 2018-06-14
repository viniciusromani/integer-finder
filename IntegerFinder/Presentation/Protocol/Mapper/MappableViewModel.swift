//
//  MappableViewModel.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 14/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

protocol MappableViewModel {
    associatedtype Model: MappableModel
    
    init(mapping model: Model)
    static func array(mapping models: [Model]) -> [Self]
}
