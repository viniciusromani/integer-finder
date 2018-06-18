//
//  MainScreenViewController.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 13/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit
import Toast_Swift
import SkyFloatingLabelTextField

protocol MainScreenViewProtocol: class {
    var presenter: MainScreenPresenterProtocol! { get set }
    var router: MainScreenRouterProtocol! { get set }
    
    func display(viewModel integerArrayViewModel: [IntegerArrayViewModel])
    func showToast(with message: String)
    func displayEmptyState(withMessage message: String)
    func displayTypedNumberValidation(withMessage message: String?)
}

class MainScreenViewController: UIViewController, LoadableView, ControllableView {
    
    // Protocol conformance
    
    var presenter: MainScreenPresenterProtocol!
    var router: MainScreenRouterProtocol!
    
    // CollectionView adapter
    
    lazy var adapter = IntegerArrayAdapter(collectionView: integerArrayCollectionView)
    
    // IBOutlets
    
    @IBOutlet weak var integerArrayCollectionView: UICollectionView!
    @IBOutlet weak var numberTextField: SkyFloatingLabelTextField!
    
    // Variables
    
    private var alertBuilder = CustomAlertBuilder()
    
    // View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showActivityIndicatorView(at: integerArrayCollectionView)
        presenter.retrieveIntegerArray()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBarTheme()
        hideNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        showNavigationBar()
    }
    
    // IBActions
    
    @IBAction func matchButtonTouchedUpInside(_ sender: UIButton) {
        presenter.validate(typedNumber: numberTextField.text)
//        let action = { }
//        let buttonTuple: CustomAlertButtonTuple = (text: "Teste", theme: DefaultAlertButton(), action: action)
//        alertBuilder = alertBuilder.setButtons(with: [buttonTuple])
//        let viewcontroller = alertBuilder.build()
//        present(viewcontroller, animated: true, completion: nil)
    }
    
    @IBAction func redefineIntegerArrayButtonTouchedUpInside(_ sender: UIButton) {
        presenter.retrieveIntegerArray()
    }
    
    @IBAction func previousMatchesButtonTouchedUpInside(_ sender: UIButton) {
        router.navigateToHistory()
    }
}

extension MainScreenViewController: MainScreenViewProtocol {
    func showToast(with message: String) {
        view.makeToast(message)
    }
    
    func display(viewModel integerArrayViewModel: [IntegerArrayViewModel]) {
        hideActivityIndicatorView()
        adapter.setDataSet(integerArrayViewModel)
    }
    
    func displayEmptyState(withMessage message: String) {
        hideActivityIndicatorView()
        showEmptyState(withMessage: message, at: integerArrayCollectionView)
    }
    
    func displayTypedNumberValidation(withMessage message: String?) {
        numberTextField.errorMessage = message
    }
}
