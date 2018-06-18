//
//  UIView+NSLayoutConstraint.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 16/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import UIKit

extension UIView {
    func setWidthConstraint(_ constraintValue: CGFloat) {
        let widthConstraint = NSLayoutConstraint(item: self,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1,
                                                 constant: constraintValue)
        self.addConstraint(widthConstraint)
    }
    
    func setHeightConstraint(_ constraintValue: CGFloat) {
        let heightConstraint = NSLayoutConstraint(item: self,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1,
                                                  constant: constraintValue)
        self.addConstraint(heightConstraint)
    }
    
    func setTopConstraint(_ constraintValue: CGFloat, for view: UIView, relatedTo relatedView: UIView?) {
        let topConstraint = NSLayoutConstraint(item: view,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: relatedView,
                                               attribute: .top,
                                               multiplier: 1,
                                               constant: constraintValue)
        relatedView?.addConstraint(topConstraint)
    }
    
    func setBottomConstraint(_ constraintValue: CGFloat, for view: UIView, relatedTo relatedView: UIView?) {
        let bottomConstraint = NSLayoutConstraint(item: view,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: relatedView,
                                                  attribute: .bottom,
                                                  multiplier: 1,
                                                  constant: constraintValue)
        relatedView?.addConstraint(bottomConstraint)
    }
    
    func setLeftConstraint(_ constraintValue: CGFloat, for view: UIView, relatedTo relatedView: UIView?) {
        let leftConstraint = NSLayoutConstraint(item: view,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: relatedView,
                                                attribute: .left,
                                                multiplier: 1,
                                                constant: constraintValue)
        relatedView?.addConstraint(leftConstraint)
    }
    
    func setRightConstraint(_ constraintValue: CGFloat, for view: UIView, relatedTo relatedView: UIView?) {
        let rightConstraint = NSLayoutConstraint(item: view,
                                                 attribute: .right,
                                                 relatedBy: .equal,
                                                 toItem: relatedView,
                                                 attribute: .right,
                                                 multiplier: 1,
                                                 constant: constraintValue)
        relatedView?.addConstraint(rightConstraint)
    }
    
    func setCenterXConstraint(for view: UIView, relatedTo relatedView: UIView?) {
        let centerXConstraint = NSLayoutConstraint(item: view,
                                                   attribute: .centerX,
                                                   relatedBy: .equal,
                                                   toItem: relatedView,
                                                   attribute: .centerX,
                                                   multiplier: 1,
                                                   constant: 0)
        relatedView?.addConstraint(centerXConstraint)
    }
    
    func setCenterYConstraint(for view: UIView, relatedTo relatedView: UIView?) {
        let centerYConstraint = NSLayoutConstraint(item: view,
                                                   attribute: .centerY,
                                                   relatedBy: .equal,
                                                   toItem: relatedView,
                                                   attribute: .centerY,
                                                   multiplier: 1,
                                                   constant: 0)
        relatedView?.addConstraint(centerYConstraint)
    }
    
    func setConstraints(with format: String, for views: [String: Any]) {
        let constraints = NSLayoutConstraint.constraints(withVisualFormat: format,
                                                         options: [],
                                                         metrics: nil,
                                                         views: views)
        self.addConstraints(constraints)
    }
}
