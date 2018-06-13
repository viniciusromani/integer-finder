//
//  GenericEntityMapper.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 13/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Moya
import RxSwift

/*
 * This is a generic mapper for incoming entities from rxswift
 * methods. If you would like to have your own mapper (recommended
 * for some specifics treatments your application may have) you
 * should use a different method name and signature. E.g:
 * extension ObservableType where E == Response {
 *     func mapCustomEntity() -> Observable<CustomEntity> {
 *         /* use flatMap to map to your custom entity using a custom logic */
 *     }
 * }
 */

/*
 * Mapper for a single incoming entity
 */
extension ObservableType where E == Response {
    
    func mapEntity<Entity: MappableEntity>(_ type: Entity.Type) -> Observable<Entity> {
        let mappedEntity = flatMap { response -> Observable<Entity> in
            guard let entity = try? JSONDecoder().decode(Entity.self, from: response.data) else {
                return Observable.error(JSONError.cannotMapToEntity)
            }
            return Observable.just(entity)
        }
        return mappedEntity
    }
}

/*
 * Mapper for an array of entities
 */
extension ObservableType where E == Response {
    
    func mapEntities<Entity: MappableEntity>(_ type: Entity.Type) -> Observable<[Entity]> {
        let mappedEntities = flatMap { response -> Observable<[Entity]> in
            guard let entities = try? JSONDecoder().decode([Entity].self, from: response.data) else {
                return Observable.error(JSONError.cannotMapToEntity)
            }
            return Observable.just(entities)
        }
        return mappedEntities
    }
}
