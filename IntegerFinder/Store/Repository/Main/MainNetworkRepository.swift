//
//  MainNetworkRepository.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 13/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Moya
import RxSwift

struct MainNetworkRepository: MainRepository {
    
    let provider = MoyaProvider<IntegerFinderAPI>()
    
    func fetchIntegerArray() -> Observable<[Int]> {
        return provider.rx.request(.fetchIntegerArray)
                .asObservable()
                .debug()
                .filterSuccessfulStatusCodes()
                .catchHTTPError()
                .mapEntities(Int.self)
    }
}
