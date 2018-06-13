//
//  IntegerArrayCollectionView.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 13/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

final class IntegerArrayAdapter: NSObject {
    var dataSet: [IntegerArrayViewModel] = []
    var collectionView: UICollectionView
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        
        setup(collectionView: collectionView)
    }
}

extension IntegerArrayAdapter: CollectionViewProtocol {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = R.reuseIdentifier.integerArrayCollectionViewCell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: model(for: indexPath))
        return cell
    }
}

extension IntegerArrayAdapter: CollectionViewLayoutProtocol {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = CGFloat(165.0)
        let cellSpacing = (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 20.0
        let numberOfCellsPerRow = CGFloat(4)
        let dividedWidth = (collectionView.bounds.width - (cellSpacing * numberOfCellsPerRow)) / numberOfCellsPerRow
        let size = CGSize(width: dividedWidth - cellSpacing, height: cellHeight)
        return size
    }
}

extension IntegerArrayAdapter: CollectionViewAdapter {
    typealias ModelType = IntegerArrayViewModel
    
    func registerCell() {
        collectionView.register(R.nib.integerArrayCollectionViewCell)
    }
}
