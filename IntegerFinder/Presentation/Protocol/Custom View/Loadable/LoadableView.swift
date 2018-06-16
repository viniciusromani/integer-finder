//
//  LoadableView.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 16/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import UIKit

protocol LoadableView: CustomView {
    func showActivityIndicatorView(at viewElement: UIView?)
    func hideActivityIndicatorView()
}
