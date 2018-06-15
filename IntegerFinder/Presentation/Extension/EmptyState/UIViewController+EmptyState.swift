//
//  UIViewController+EmptyState.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 15/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showEmptyState(withMessage message: String) {
        let emptyStateView = EmptyStateView(message: message)
        
        view.addSubview(emptyStateView)
        emptyStateView.translatesAutoresizingMaskIntoConstraints = false
        setWidthConstraint(view.bounds.width, for: emptyStateView)
        setHeightConstraint(view.bounds.height, for: emptyStateView)
    }
    
    private func setWidthConstraint(_ constraintValue: CGFloat, for view: UIView) {
        let widthConstraint = NSLayoutConstraint(item: view,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1,
                                                 constant: constraintValue)
        view.addConstraint(widthConstraint)
    }
    
    private func setHeightConstraint(_ constraintValue: CGFloat, for view: UIView) {
        let heightConstraint = NSLayoutConstraint(item: view,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1,
                                                  constant: constraintValue)
        view.addConstraint(heightConstraint)
    }
}
