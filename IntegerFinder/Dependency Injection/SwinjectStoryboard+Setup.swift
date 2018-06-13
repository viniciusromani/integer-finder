//
//  SwinjectStoryboard+Setup.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 13/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    @objc class func setup() {
        RepositoryDependencyInjection.registerRepositories(with: defaultContainer)
        UseCaseDependencyInjection.registerUseCases(with: defaultContainer)
        SceneDependencyInjection.registerScenes(with: defaultContainer)
    }
}
