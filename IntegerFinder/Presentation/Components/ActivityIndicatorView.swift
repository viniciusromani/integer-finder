//
//  ActivityIndicatorView.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 16/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import UIKit

class ActivityIndicatorView: UIView {
    
    private let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        
        setup()
    }
}

extension ActivityIndicatorView {
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = UIColor.black
        activityIndicator.startAnimating()
        
        addSubview(activityIndicator)
        setActivityIndicatorConstraints()
    }
    
    private func setActivityIndicatorConstraints() {
        setWidthConstraint(40)
        setHeightConstraint(40)

        var constraint = NSLayoutConstraint(item: activityIndicator,
                                            attribute: .centerX,
                                            relatedBy: .equal,
                                            toItem: self,
                                            attribute: .centerX,
                                            multiplier: 1,
                                            constant: 0)
        addConstraint(constraint)
        constraint = NSLayoutConstraint(item: activityIndicator,
                                        attribute: .centerY,
                                        relatedBy: .equal,
                                        toItem: self,
                                        attribute: .centerY,
                                        multiplier: 1,
                                        constant: 0)
        addConstraint(constraint)
    }
}

