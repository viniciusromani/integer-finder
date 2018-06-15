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
    
    private var title: String {
        didSet {
            titleLabel.text = title
        }
    }
    
    private var contentView = UIView(frame: .zero)
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = self.title
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
        addSubview(contentView)
    }
}

extension EmptyStateView {
    private func setup() {
        contentView.addSubview(titleLabel)
        
        titleLabel.center = contentView.center
    }
}
