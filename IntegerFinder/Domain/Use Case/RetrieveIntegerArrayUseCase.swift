//
//  RetrieveIntegerArrayUseCase.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 13/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import RxSwift

struct RetrieveIntegerArrayUseCase {
    
    let repository: MainRepository
    
    func retrieveIntegerArray() -> Observable<[Int]> {
        return repository.fetchIntegerArray()
    }
}
