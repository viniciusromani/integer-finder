//
//  MainScreenViewController.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 13/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

protocol MainScreenViewProtocol: class {
    var presenter: MainScreenPresenterProtocol! { get set }
    var router: MainScreenRouterProtocol! { get set }
    
    func display(viewModel integerArrayViewModel: IntegerArrayViewModel)
}

class MainScreenViewController: UIViewController {
    
    // Protocol conformance
    
    var presenter: MainScreenPresenterProtocol!
    var router: MainScreenRouterProtocol!
    
    // CollectionView adapter
    
    lazy var adapter = IntegerArrayAdapter(collectionView: integerArrayCollectionView)
    
    // IBOutlets
    
    @IBOutlet weak var integerArrayCollectionView: UICollectionView!
    
    // View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.retrieveIntegerArray()
    }
}

extension MainScreenViewController: MainScreenViewProtocol {
    func display(viewModel integerArrayViewModel: IntegerArrayViewModel) {
        
    }
}
