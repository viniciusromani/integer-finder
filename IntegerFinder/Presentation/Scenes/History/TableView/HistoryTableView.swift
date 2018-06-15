//
//  HistoryTableView.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 15/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

final class HistoryTableViewAdapter: NSObject {
    var dataSet: [HistoryViewModel] = []
    var tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        setup(tableView: tableView)
    }
}

extension HistoryTableViewAdapter: TableViewProtocol {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = R.reuseIdentifier.historyTableViewCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) else {
            return UITableViewCell()
        }
        
        cell.configure(with: model(for: indexPath))
        return cell
    }
}

extension HistoryTableViewAdapter: TableViewAdapter {
    typealias ModelType = HistoryViewModel
    
    func registerCell() {
        tableView.register(R.nib.historyTableViewCell)
    }
}


