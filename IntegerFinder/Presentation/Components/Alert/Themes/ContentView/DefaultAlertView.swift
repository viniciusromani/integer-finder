//
//  DefaultAlertView.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 17/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

struct DefaultAlertView: CustomAlertViewTheme {
    var overlayColor: UIColor? = UIColor.clear
    var backgroundColor: UIColor? = UIColor.white
    var borderRadius: CGFloat? = CGFloat(8)
    var borderWidth: CGFloat? = nil
    var borderColor: UIColor? = nil
}
