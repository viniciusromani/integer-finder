//
//  CustomAlertBuilder.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 17/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

typealias CustomAlertButtonAction = () -> ()
typealias CustomAlertButtonTuple = (text: String, theme: CustomAlertButtonTheme, action: CustomAlertButtonAction)

class CustomAlertBuilder {
    
    private let viewController: UIViewController
    private let contentView: UIView
    
    fileprivate var contentViews: [String: UIView] = [:]
    private var sortedContentViews: [(identifier: String, view: UIView)] = []
    private var buttonsActions: [(tag: Int, action: CustomAlertButtonAction)] = []
    private var adapter: IntegerArrayAdapter?
    
    init(with alertTheme: CustomAlertViewTheme = DefaultAlertView()) {
        viewController = UIViewController()
        contentView = UIView()
        
        contentViews = [:]
        sortedContentViews = []
        buttonsActions = []
        
        createMainView(with: alertTheme)
        
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.modalTransitionStyle = .crossDissolve
    }
    
    func setIntegerArrayCollectionView(with sequence: [Int]) -> CustomAlertBuilder {
        let collectionView = createCollectionView()
        setupCollectionView(collectionView)
        
        let collectionIdentifier = "collectionView"
        contentViews["collectionView"] = collectionView
        if !sortedContentViews.contains(where: { $0.identifier == collectionIdentifier }) {
            sortedContentViews.append((identifier: "collectionView", view: collectionView))
        }
        
        setupIntegerArrayCollectionViewAdapter(with: sequence, and: collectionView)
        
        return self
    }
    
    func setButtons(with tuples: [CustomAlertButtonTuple]) -> CustomAlertBuilder {
        
        for (index, tuple) in tuples.enumerated() {
            let button = createButton(with: tuple, and: index)
            setupButton(button)
            
            let buttonIdentifier = "button\(index)"
            contentViews[buttonIdentifier] = button
            if !sortedContentViews.contains(where: { $0.identifier == buttonIdentifier }) {
                sortedContentViews.append((identifier: buttonIdentifier, view: button))
            }
            buttonsActions.append((tag: index, action: tuple.action))
        }
        return self
    }
    
    func build() -> UIViewController {
        // set content constraints
        setupVerticalConstraints()
        return viewController
    }
}

extension CustomAlertBuilder {
    private func createMainView(with alertTheme: CustomAlertViewTheme) {
        viewController.view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor.blue
        contentView.clipsToBounds = true
        
        let view: UIView = viewController.view
        
        // appearance
        
        view.backgroundColor = alertTheme.overlayColor
        contentView.backgroundColor = alertTheme.backgroundColor
        contentView.layerCornerRadius = alertTheme.borderRadius ?? 0.0
        contentView.layerBorderWidth = alertTheme.borderWidth ?? 0.0
        contentView.layerBorderColor = alertTheme.borderColor ?? UIColor.clear
        contentView.clipsToBounds = true
        
        // constraints
        
        contentView.setLeftConstraint(25, relatedTo: view)
        contentView.setCenterXConstraint(relatedTo: view)
        contentView.setCenterYConstraint(relatedTo: view)
    }
    
    private func createButton(with tuple: CustomAlertButtonTuple, and tag: Int) -> UIButton {
        
        let button = UIButton(type: .custom)
        let theme = tuple.theme
        
        // appearance
        
        button.tag = tag
        button.setTitle(tuple.text, for: .normal)
        button.layerCornerRadius = theme.borderRadius ?? 0.0
        button.titleLabel?.font = theme.font
        button.setTitleColor(theme.textColor, for: .normal)
        button.backgroundColor = theme.backgroundColor
        button.layerBorderColor = theme.borderColor ?? UIColor.clear
        button.layerBorderWidth = theme.borderWidth ?? 0.0
        
        // settings
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonTouched(_:)), for: .touchUpInside)
        
        // constraints
        
        button.setHeightConstraint(44)
        
        return button
    }
    
    private func createCollectionView() -> UICollectionView {
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.clipsToBounds = true
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }
}

// MARK: - Actions

extension CustomAlertBuilder {
    
    @objc func buttonTouched(_ sender: UIButton) {
        let actionTuple = buttonsActions[sender.tag]
        viewController.dismiss(animated: true) {
            actionTuple.action()
        }
    }
}

extension CustomAlertBuilder {
    
    private func setupButton(_ button: UIButton) {
        contentView.addSubview(button)
        contentView.setConstraints(with: "H:|-12-[button]-12-|", for: ["button": button])
    }
    
    private func setupCollectionView(_ collectionView: UICollectionView) {
        contentView.addSubview(collectionView)
        contentView.setConstraints(with: "H:|-20-[collectionView]-20-|", for: ["collectionView": collectionView])
        contentView.setHeightConstraint(380)
    }
    
    private func setupIntegerArrayCollectionViewAdapter(with sequence: [Int], and collectionView: UICollectionView) {
        adapter = IntegerArrayAdapter(collectionView: collectionView)
        let x = IntegerArrayViewModel.array(mapping: sequence)
        adapter?.setDataSet(x)
    }
    
    private func setupVerticalConstraints() {
        let format = buildVerticalConstraintString()
        contentView.setConstraints(with: format, for: contentViews)
    }
    
    private func buildVerticalConstraintString() -> String {
        var string = "V:|-"
        for (identifier, _) in sortedContentViews {
            string = string.appending("\(20)-[\(identifier)]-")
        }
        string = string.appending("15-|")
        return string
    }
}

