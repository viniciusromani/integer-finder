//
//  DependencyInjectionTests.swift
//  IntegerFinderTests
//
//  Created by Vinicius Romani on 16/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import XCTest
import Nimble
@testable import IntegerFinder

class DependencyInjectionTests: XCTestCase {
    
    func testMainScreenConfigurator() {
        let mainScreenViewController = instantiateMainViewController()
        expect(mainScreenViewController).toNot(beNil())
        expect(mainScreenViewController?.presenter).toNot(beNil())
        expect(mainScreenViewController?.router).toNot(beNil())
        
        let presenter = mainScreenViewController?.presenter
        expect(presenter?.view).toNot(beNil())
        expect(presenter?.retrieveIntegerArrayUseCase).toNot(beNil())
        expect(presenter?.integerMatcherUseCase).toNot(beNil())
        
        let router = mainScreenViewController?.router
        expect(router?.viewController).toNot(beNil())
    }
    
    func testHistoryScreenConfigurator() {
        let historyViewController = instantiateHistoryViewController()
        expect(historyViewController).toNot(beNil())
        expect(historyViewController?.presenter).toNot(beNil())
        expect(historyViewController?.router).toNot(beNil())
        
        let presenter = historyViewController?.presenter
        expect(presenter?.view).toNot(beNil())
        
        let router = historyViewController?.router
        expect(router?.viewController).toNot(beNil())
    }
}

extension DependencyInjectionTests {
    private func instantiateMainViewController() -> MainScreenViewController? {
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController
        return navigationController?.topViewController as? MainScreenViewController
    }
    
    private func instantiateHistoryViewController() -> HistoryViewController? {
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "HistoryViewController") as? HistoryViewController
    }
}
