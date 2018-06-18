//
//  HistoryTableView.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 15/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

protocol HistoryAdapterViewProtocol {
    func didSelect(history historyViewModel: HistoryViewModel)
}

final class HistoryTableViewAdapter: NSObject {
    var dataSet: [HistoryViewModel] = []
    var tableView: UITableView
    var viewDelegate: HistoryAdapterViewProtocol?
    
    init(tableView: UITableView, and viewDelegate: HistoryAdapterViewProtocol?) {
        self.tableView = tableView
        self.viewDelegate = viewDelegate
        super.init()
        
        setup(tableView: tableView)
    }
}

extension HistoryTableViewAdapter: TableViewProtocol {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberOfRows + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row != 0 else {
            return dequeueHeaderCell(with: indexPath)
        }
        
        return dequeueHistoryCell(with: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let index = IndexPath(row: indexPath.row - 1, section: indexPath.section)
        viewDelegate?.didSelect(history: model(for: index))
    }
}

extension HistoryTableViewAdapter: TableViewAdapter {
    typealias ModelType = HistoryViewModel
    
    func registerCell() {
        tableView.register(R.nib.historyTableViewCell)
        tableView.register(R.nib.headerTableViewCell)
    }
}

extension HistoryTableViewAdapter {
    private func dequeueHeaderCell(with indexPath: IndexPath) -> UITableViewCell {
        let headerIdentifier = R.reuseIdentifier.historyHeaderTableViewCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: headerIdentifier, for: indexPath) else {
            return UITableViewCell()
        }
        return cell
    }
    
    private func dequeueHistoryCell(with indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = R.reuseIdentifier.historyTableViewCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) else {
            return UITableViewCell()
        }
        
        let index = IndexPath(row: indexPath.row - 1, section: indexPath.section)
        cell.configure(with: model(for: index))
        return cell
    }
}


