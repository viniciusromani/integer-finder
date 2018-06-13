//
//  JSONError.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 13/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

enum JSONError: Error {
    case malformed
    case typeMismatch
    case keyNotFound
    case valueNotFound
    case cannotMapToEntity
}
