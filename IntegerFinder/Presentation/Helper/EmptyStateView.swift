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
    
    private var title: String = ""
    private var contentView = UIView(frame: .zero)
    
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
        
        addSubview(contentView)
        setup()
    }
}

extension EmptyStateView {
    private func setup() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        backgroundColor = UIColor.lightGray
    }
}
