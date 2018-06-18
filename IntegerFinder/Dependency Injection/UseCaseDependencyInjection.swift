//
//  UseCaseDependencyInjection.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 13/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Swinject

struct UseCaseDependencyInjection {
    
    static func registerUseCases(with container: Container) {
        container.register(RetrieveIntegerArrayUseCase.self) { (resolver) -> RetrieveIntegerArrayUseCase in
            return RetrieveIntegerArrayUseCase(repository: resolver.resolve(MainRepository.self)!)
        }
        
        container.register(IntegerMatcherArrayUseCase.self) { (resolver) -> IntegerMatcherArrayUseCase in
            return IntegerMatcherArrayUseCase()
        }
        
        container.register(IntegerValidatorUseCase.self) { (resolver) -> IntegerValidatorUseCase in
            return IntegerValidatorUseCase()
        }
    }
}
