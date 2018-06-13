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
    }
}
