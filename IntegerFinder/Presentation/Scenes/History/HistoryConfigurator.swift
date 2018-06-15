//
//  HistoryConfigurator.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 15/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Swinject

struct HistoryConfigurator {
    static func configureHistoryScene(with container: Container) {
        container.storyboardInitCompleted(HistoryViewController.self) { (resolver, controller) in
            let presenter = HistoryPresenter()
            let router = HistoryRouter()
            
            presenter.view = controller
            
            router.viewController = controller
            
            controller.presenter = presenter
            controller.router = router
        }
    }
}
