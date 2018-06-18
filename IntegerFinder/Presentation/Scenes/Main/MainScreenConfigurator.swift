//
//  MainScreenConfigurator.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 13/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Swinject

struct MainScreenConfigurator {
    static func configureMainScreenScene(with container: Container) {
        container.storyboardInitCompleted(MainScreenViewController.self) { (resolver, controller) in
            let presenter = MainScreenPresenter()
            let router = MainScreenRouter()
            
            presenter.view = controller
            presenter.retrieveIntegerArrayUseCase = resolver.resolve(RetrieveIntegerArrayUseCase.self)!
            presenter.integerMatcherUseCase = resolver.resolve(IntegerMatcherArrayUseCase.self)!
            presenter.validatorUseCase = resolver.resolve(IntegerValidatorUseCase.self)!
            
            router.viewController = controller
            
            controller.presenter = presenter
            controller.router = router
        }
    }
}
