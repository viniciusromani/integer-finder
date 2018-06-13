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
    var retrieveIntegerArrayUseCase: RetrieveIntegerArrayUseCase! { get set }
    
    func retrieveIntegerArray()
}

class MainScreenPresenter: MainScreenPresenterProtocol {
    
    let disposeBag = DisposeBag()
    
    // Protocol conformance
    
    var view: MainScreenViewProtocol!
    var retrieveIntegerArrayUseCase: RetrieveIntegerArrayUseCase!
    
    func retrieveIntegerArray() {
        retrieveIntegerArrayUseCase.retrieveIntegerArray().subscribe(onNext: { [weak self] (integerArray) in
            
            guard let weakSelf = self else { return }
//            let gistsViewModel = GistViewModel.array(mapping: gists)
//            let publicGists = PublicGistsViewModel(gists: gistsViewModel)
//            weakSelf.view.display(publicGists)
            
        }, onError: { (error) in
            
            // error
        }).disposed(by: disposeBag)
    }
}






