//
//  HistoryTableViewCell.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 15/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    func configure(with viewModel: HistoryViewModel) {
        numberLabel.text = viewModel.number
        statusLabel.text = viewModel.status
    }
}
