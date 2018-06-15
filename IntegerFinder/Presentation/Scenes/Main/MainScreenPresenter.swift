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
    var view: MainScreenViewProtocol! { get set }
    var currentIntegerArray: [Int] { get set }
    var matches: [MatchModel] { get set }
    
    var retrieveIntegerArrayUseCase: RetrieveIntegerArrayUseCase! { get set }
    var integerMatcherUseCase: IntegerMatcherArrayUseCase! { get set }
    
    func retrieveIntegerArray()
    func testMatch(_ stringValue: String?)
}

class MainScreenPresenter: MainScreenPresenterProtocol {
    
    let disposeBag = DisposeBag()
    
    // Protocol conformance
    
    var view: MainScreenViewProtocol!
    var currentIntegerArray: [Int] = []
    var matches: [MatchModel] = []
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
    
    func testMatch(_ stringValue: String?) {
        guard let string = stringValue, let int = Int(string) else { return }
        let result = integerMatcherUseCase.int(int, matchesInSequence: currentIntegerArray)
        let message = result ?
            R.string.localizable.found():
            R.string.localizable.notFound()
        view.showToast(with: message)
        
        let params = MatchModelParams(typedValue: int,
                                      integerArray: currentIntegerArray,
                                      wasFound: result)
        storeMatchModel(with: params)
    }
}

typealias MatchModelParams = (typedValue: Int, integerArray: [Int], wasFound: Bool)

extension MainScreenPresenter {
    private func storeMatchModel(with params: MatchModelParams) {
        let matchModel = MatchModel(typedValue: params.typedValue,
                                    integerArray: params.integerArray,
                                    wasFound: params.wasFound)
        matches.append(matchModel)
    }
}







