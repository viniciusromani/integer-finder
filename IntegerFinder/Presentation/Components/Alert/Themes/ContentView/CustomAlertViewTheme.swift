//
//  CustomAlertViewTheme.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 17/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

protocol CustomAlertViewTheme {
    var overlayColor: UIColor? { get set }
    var backgroundColor: UIColor? { get set }
    var borderRadius: CGFloat? { get set }
    var borderWidth: CGFloat? { get set }
    var borderColor: UIColor? { get set }
}
