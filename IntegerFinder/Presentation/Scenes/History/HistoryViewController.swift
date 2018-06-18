//
//  HistoryViewController.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 15/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

protocol HistoryViewProtocol: class {
    var presenter: HistoryPresenterProtocol! { get set }
    var router: HistoryRouterProtocol! { get set }
    
    func display(viewModel historyViewModelArray: [HistoryViewModel])
    func displayEmptyState(withMessage message: String)
}

class HistoryViewController: UIViewController, ControllableView {
    
    // Protocol conformance
    
    var presenter: HistoryPresenterProtocol!
    var router: HistoryRouterProtocol!
    
    // TableView adapter
    
    lazy var adapter = HistoryTableViewAdapter(tableView: historyTableView, and: self)
    
    // IBOutlets
    
    @IBOutlet weak var historyTableView: UITableView!
    
    // Variables
    
    private var alertBuilder = CustomAlertBuilder()
    
    // View life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.retrieveMatches()
    }
}

extension HistoryViewController: HistoryViewProtocol {
    
    func display(viewModel historyViewModelArray: [HistoryViewModel]) {
        adapter.setDataSet(historyViewModelArray)
    }
    
    func displayEmptyState(withMessage message: String) {
        showEmptyState(withMessage: message)
    }
}

extension HistoryViewController: HistoryAdapterViewProtocol {
    func didSelect(history historyViewModel: HistoryViewModel) {        
        let action = { }
        let buttonTuple: CustomAlertButtonTuple = (text: R.string.localizable.close(),
                                                   theme: DefaultAlertButton(),
                                                   action: action)
        alertBuilder = alertBuilder.setButtons(with: [buttonTuple])
        let viewcontroller = alertBuilder.build()
        present(viewcontroller, animated: true, completion: nil)
    }
}


