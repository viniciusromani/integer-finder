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
}

class HistoryViewController: UIViewController, ControllableView {
    
    // Protocol conformance
    
    var presenter: HistoryPresenterProtocol!
    var router: HistoryRouterProtocol!
    
    // TableView adapter
    
    lazy var adapter = HistoryTableViewAdapter(tableView: historyTableView)
    
    // IBOutlets
    
    @IBOutlet weak var historyTableView: UITableView!
    
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
}
