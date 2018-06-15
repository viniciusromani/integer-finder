//
//  UIView+IBDesignables.swift
//  IntegerFinder
//
//  Created by Vinicius Romani on 15/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var layerBorderColor: UIColor {
        get {
            let color = layer.borderColor.flatMap { UIColor(cgColor: $0) }
            return color ?? .clear
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var layerCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue>0 && self.layer.shadowOpacity==0 ? true : false
        }
    }
    
    @IBInspectable var layerBorderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
            layer.shouldRasterize = true
            layer.rasterizationScale = UIScreen.main.scale
            layer.masksToBounds = false
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowColor: UIColor {
        get {
            let color = layer.shadowColor.flatMap { UIColor(cgColor: $0) }
            return color ?? .clear
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
}
