//
//  MainScreenRouter.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 13/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

protocol MainScreenRouterProtocol: class {
    var viewController: MainScreenViewController! { get set }
    
    func navigateToHistory()
}

class MainScreenRouter: MainScreenRouterProtocol {
    
    // Segue Identifier
    
    let navigateToHistoryIdentifier = R.segue.mainScreenViewController.navigateToHistory
    
    // Protocol conformance
    
    var viewController: MainScreenViewController!
    
    func navigateToHistory() {
        viewController.performSegue(withIdentifier: navigateToHistoryIdentifier, sender: nil)
    }
}

extension MainScreenViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case R.segue.mainScreenViewController.navigateToHistory.identifier:
            passDataToHistory(segue, sender: sender)
        default: break
        }
    }
    
    func passDataToHistory(_ segue: UIStoryboardSegue, sender: Any?) {
        guard let historyScene = R.segue.mainScreenViewController.navigateToHistory(segue: segue) else {
            return
        }
        
        let historyViewController = historyScene.destination
        historyViewController.presenter.matches = self.presenter.matches
    }
}


