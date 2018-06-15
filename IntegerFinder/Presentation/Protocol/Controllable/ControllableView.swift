//
//  ControllableView.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 15/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

protocol ControllableView {
    func showEmptyState(withMessage message: String, at viewElement: UIView?)
    func hideEmptyState()
}
