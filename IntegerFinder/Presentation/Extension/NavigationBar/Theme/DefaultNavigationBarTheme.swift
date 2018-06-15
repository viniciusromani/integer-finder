//
//  DefaultNavigationBarTheme.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 15/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

struct DefaultNavigationBarTheme: NavigationBarTheme {
    var backgroundColor: UIColor? = R.color.navigationBar()
    var titleColor: UIColor? = UIColor.white
    var style: UIBarStyle = UIBarStyle.black
}
