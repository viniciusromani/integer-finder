//
//  HistoryRouter.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 15/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

protocol HistoryRouterProtocol: class {
    var viewController: HistoryViewController! { get set }
    
    func navigateToList()
}

class HistoryRouter: HistoryRouterProtocol {
    
    // Segue Identifier
    
    
    // Protocol conformance
    
    var viewController: HistoryViewController!
    
    func navigateToList() {
        
    }
}
