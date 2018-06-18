//
//  DefaultAlertButton.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 17/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

struct DefaultAlertButton: CustomAlertButtonTheme {
    var borderRadius: CGFloat? = CGFloat(6)
    var font: UIFont? = UIFont.systemFont(ofSize: 15)
    var textColor: UIColor? = UIColor.white
    var backgroundColor: UIColor? = R.color.actionButton()
    var borderWidth: CGFloat? = nil
    var borderColor: UIColor? = nil
}
