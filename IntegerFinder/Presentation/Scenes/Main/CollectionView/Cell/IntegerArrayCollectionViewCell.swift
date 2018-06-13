//
//  IntegerArrayCollectionViewCell.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 13/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

class IntegerArrayCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    func configure(with viewModel: IntegerArrayViewModel) {
        numberLabel.text = viewModel.number
    }
}
