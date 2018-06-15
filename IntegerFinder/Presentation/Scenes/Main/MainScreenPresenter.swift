//
//  MainScreenPresenter.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 13/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import RxSwift

protocol MainScreenPresenterProtocol: class {
    weak var view: MainScreenViewProtocol! { get set }
    var currentIntegerArray: [Int] { get set }
    
    var retrieveIntegerArrayUseCase: RetrieveIntegerArrayUseCase! { get set }
    var integerMatcherUseCase: IntegerMatcherArrayUseCase! { get set }
    
    func retrieveIntegerArray()
    func testMatch(_ stringValue: String?) -> Bool
}

class MainScreenPresenter: MainScreenPresenterProtocol {
    
    let disposeBag = DisposeBag()
    
    // Protocol conformance
    
    var view: MainScreenViewProtocol!
    var currentIntegerArray: [Int] = []
    var retrieveIntegerArrayUseCase: RetrieveIntegerArrayUseCase!
    var integerMatcherUseCase: IntegerMatcherArrayUseCase!
    
    func retrieveIntegerArray() {
        retrieveIntegerArrayUseCase.retrieveIntegerArray().subscribe(onNext: { [weak self] (integerArray) in
            
            guard let weakSelf = self else { return }
            weakSelf.currentIntegerArray = integerArray
            let viewModelArray = IntegerArrayViewModel.array(mapping: integerArray)
            weakSelf.view.display(viewModel: viewModelArray)
            
        }, onError: { (error) in
            
            // error
        }).disposed(by: disposeBag)
    }
    
    func testMatch(_ stringValue: String?) -> Bool {
        guard let string = stringValue, let int = Int(string) else { return false }
        return integerMatcherUseCase.int(int, matchesInSequence: currentIntegerArray)
    }
}
