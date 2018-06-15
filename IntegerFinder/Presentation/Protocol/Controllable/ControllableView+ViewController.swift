//
//  ControllableView+ViewController.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 15/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import UIKit

extension ControllableView where Self: UIViewController {
    func showEmptyState(withMessage message: String, at viewElement: UIView? = nil) {
        let viewToShowEmptyStateOn: UIView = viewElement == nil ? view: viewElement!
        
        let emptyStateView = EmptyStateView(message: message)
        viewToShowEmptyStateOn.addSubview(emptyStateView)
        emptyStateView.translatesAutoresizingMaskIntoConstraints = false
        setWidthConstraint(viewToShowEmptyStateOn.bounds.width, for: emptyStateView)
        setHeightConstraint(viewToShowEmptyStateOn.bounds.height, for: emptyStateView)
    }
    
    func hideEmptyState() {
        guard let emptyStateView = findEmptyStateView(at: view) else { return }
        emptyStateView.removeFromSuperview()
    }
    
    private func findEmptyStateView(at viewToFind: UIView) -> UIView? {
        for subview in viewToFind.subviews {
            if subview is EmptyStateView {
                return subview
            }
            
            if subview.subviews.count > 0 {
                return findEmptyStateView(at: subview)
            }
        }
        return nil
    }
}

extension ControllableView {
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
