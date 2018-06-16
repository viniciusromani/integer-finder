//
//  EmptyStateView.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 15/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

class EmptyStateView: UIView {
    
    private var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = self.title
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message string: String) {
        title = string
        super.init(frame: .zero)
        
        setup()
    }
}

extension EmptyStateView {
    private func setup() {
        
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        setTitleLabelConstraints()
    }
    
    private func setTitleLabelConstraints() {
        setLeftConstraint(25, for: titleLabel, relatedTo: self)
        
        var constraint = NSLayoutConstraint(item: titleLabel,
                                            attribute: .centerX,
                                            relatedBy: .equal,
                                            toItem: self,
                                            attribute: .centerX,
                                            multiplier: 1,
                                            constant: 0)
        addConstraint(constraint)
        constraint = NSLayoutConstraint(item: titleLabel,
                                        attribute: .centerY,
                                        relatedBy: .equal,
                                        toItem: self,
                                        attribute: .centerY,
                                        multiplier: 1,
                                        constant: 0)
        addConstraint(constraint)
    }
}
