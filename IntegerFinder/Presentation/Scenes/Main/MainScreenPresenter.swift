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
    var validatorUseCase: IntegerValidatorUseCase! { get set }
    
    func retrieveIntegerArray()
    func validate(typedNumber number: String?)
}

class MainScreenPresenter: MainScreenPresenterProtocol {
    
    let disposeBag = DisposeBag()
    
    // Protocol conformance
    
    var view: MainScreenViewProtocol!
    var currentIntegerArray: [Int] = []
    var matches: [MatchModel] = []
    var retrieveIntegerArrayUseCase: RetrieveIntegerArrayUseCase!
    var integerMatcherUseCase: IntegerMatcherArrayUseCase!
    var validatorUseCase: IntegerValidatorUseCase!
    
    func retrieveIntegerArray() {
        retrieveIntegerArrayUseCase.retrieveIntegerArray().subscribe(onNext: { [weak self] (integerArray) in
            
            guard let strongSelf = self else { return }
            strongSelf.currentIntegerArray = integerArray
            let viewModelArray = IntegerArrayViewModel.array(mapping: integerArray)
            strongSelf.view.display(viewModel: viewModelArray)
            
        }, onError: { [weak self] (error) in
            
            var message: String = ""
            switch error {
            case HTTPError.unreachable:
                message = R.string.localizable.connectionError()
            default:
                message = error.localizedDescription
            }
            
            guard let strongSelf = self else { return }
            strongSelf.view.displayEmptyState(withMessage: message)
            
        }).disposed(by: disposeBag)
    }
    
    func validate(typedNumber number: String?) {
        guard let int = Int(number ?? "") else { return }
        let result = validatorUseCase.validate(int: int)
        let message: String? = result ? nil: R.string.localizable.numberNotInRange()
        view.displayTypedNumberValidation(withMessage: message)
        
        guard result else { return }
        testMatch(number)
    }
}

typealias MatchModelParams = (typedValue: Int, integerArray: [Int], wasFound: Bool)

extension MainScreenPresenter {
    private func testMatch(_ stringValue: String?) {
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
    
    private func storeMatchModel(with params: MatchModelParams) {
        let matchModel = MatchModel(typedValue: params.typedValue,
                                    integerArray: params.integerArray,
                                    wasFound: params.wasFound)
        matches.append(matchModel)
    }
}

