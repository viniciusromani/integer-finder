//
//  HistoryPresenter.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 15/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

protocol HistoryPresenterProtocol: class {
    var view: HistoryViewProtocol! { get set }
    var matches: [MatchModel] { get set }
    
    func retrieveMatches()
}

class HistoryPresenter: HistoryPresenterProtocol {
    
    // Protocol conformance
    
    var view: HistoryViewProtocol!
    var matches: [MatchModel] = []
    
    func retrieveMatches() {
        guard matches.count > 0 else {
            let message = R.string.localizable.noMatches()
            self.view.displayEmptyState(withMessage: message)
            return
        }
        
        let historyViewModelArray = HistoryViewModel.array(mapping: matches)
        view.display(viewModel: historyViewModelArray)
    }
}
