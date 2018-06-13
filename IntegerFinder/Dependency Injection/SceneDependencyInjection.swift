//
//  SceneDependencyInjection.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 13/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Swinject

struct SceneDependencyInjection {
    
    static func registerScenes(with container: Container) {
        MainScreenConfigurator.configureMainScreenScene(with: container)
    }
}
