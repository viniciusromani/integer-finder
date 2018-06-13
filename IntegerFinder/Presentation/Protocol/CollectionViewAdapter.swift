//
//  CollectionViewAdapter.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 13/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

// MARK: - CollectionViewDataSource and Delegate

typealias CollectionViewProtocol = UICollectionViewDelegate & UICollectionViewDataSource
typealias CollectionViewLayoutProtocol = UICollectionViewDelegateFlowLayout

// MARK: - CollectionViewAdapter Protocol

protocol CollectionViewAdapter: class {
    associatedtype ModelType
    var dataSet: [ModelType] { get set }
    var collectionView: UICollectionView { get }
    func registerCell()
}

// MARK: - CollectionViewAdapter Helper Methods and Variables

extension CollectionViewAdapter where Self: CollectionViewProtocol {
    
    // MARK: - Variables
    
    var numberOfSections: Int { return 1 }
    var numberOfItems: Int { return dataSet.count }
    
    // MARK: - Helpers
    
    func setup(collectionView: UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCell()
    }
    
    func setDataSet(_ newDataSet: [ModelType]) {
        dataSet = newDataSet
        collectionView.reloadData()
    }
    
    func model(for indexPath: IndexPath) -> ModelType {
        return dataSet[indexPath.row]
    }
    
    func isLastSection(_ indexPath: IndexPath) -> Bool {
        guard let sections = numberOfSections?(in: collectionView) else {
            return false
        }
        return sections == (indexPath.section + 1)
    }
    
    func isLastRow(_ indexPath: IndexPath) -> Bool {
        let numberOfRows = collectionView(collectionView, numberOfItemsInSection: indexPath.section)
        return numberOfRows == (indexPath.row + 1)
    }
}
