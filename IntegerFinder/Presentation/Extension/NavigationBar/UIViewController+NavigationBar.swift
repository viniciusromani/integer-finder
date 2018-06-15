//
//  UIViewController+NavigationBar.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 15/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func hideNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func showNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setNavigationBarTheme(_ theme: NavigationBarTheme = DefaultNavigationBarTheme()) {
        navigationController?.navigationBar.tintColor = theme.titleColor
        navigationController?.navigationBar.barTintColor = theme.backgroundColor
        navigationController?.navigationBar.barStyle = theme.style
    }
}
