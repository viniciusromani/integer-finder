//
//  LoadableView+UIViewController.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 16/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import UIKit

extension LoadableView where Self: UIViewController {
    
    func showActivityIndicatorView(at viewElement: UIView? = nil) {
        let viewToShowActivityIndicatorOn: UIView = viewElement == nil ? view: viewElement!
        
        let activityIndicatorView = ActivityIndicatorView()
        viewToShowActivityIndicatorOn.addSubview(activityIndicatorView)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        setWidthConstraint(viewToShowActivityIndicatorOn.bounds.width, for: activityIndicatorView)
        setHeightConstraint(viewToShowActivityIndicatorOn.bounds.height, for: activityIndicatorView)
    }
    
    func hideActivityIndicatorView() {
        guard let activityIndicatorView = findActivityIndicatorView(at: view) else { return }
        activityIndicatorView.removeFromSuperview()
    }
    
    private func findActivityIndicatorView(at viewToSearchOn: UIView) -> UIView? {
        for subview in viewToSearchOn.subviews {
            if subview is ActivityIndicatorView {
                return subview
            }
            
            if subview.subviews.count > 0 {
                return findActivityIndicatorView(at: subview)
            }
        }
        return nil
    }
}
