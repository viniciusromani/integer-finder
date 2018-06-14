//
//  MappableModel.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 14/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

/*
 * This is a custom protocol that defines how an entity is
 * parsed into a model. These are methods signatures that should
 * be followed for each model at the domain layer. It is recommended
 * to implement at least one of the init methods to initialize each
 * model's attributes with its respective entity attribute
 */

protocol MappableModel {
    associatedtype Entity: MappableEntity
    
    init(mapping entity: Entity) throws
    init?(mapping entity: Entity?) throws
    static func array(mapping entities: [Entity]) throws -> [Self]
    static func array(mapping entities: [Entity]?) throws -> [Self]?
}
