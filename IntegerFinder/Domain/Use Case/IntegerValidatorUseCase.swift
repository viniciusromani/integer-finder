//
//  IntegerValidatorUseCase.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 18/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

struct IntegerValidatorUseCase {
    
    func validate(int intValue: Int) -> Bool {
        guard intValue >= -197 && intValue <= 197 else { return false }
        return true
    }
}
