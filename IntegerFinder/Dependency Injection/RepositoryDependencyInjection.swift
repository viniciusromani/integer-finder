//
//  RepositoryDependencyInjection.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 13/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Swinject

struct RepositoryDependencyInjection {
    
    static func registerRepositories(with container: Container) {
        container.register(MainRepository.self) { (resolver) -> MainRepository in
            return MainNetworkRepository()
        }
    }
}
