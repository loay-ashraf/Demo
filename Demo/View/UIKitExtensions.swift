//
//  UIKitExtensions.swift
//  Demo
//
//  Created by Loay Ashraf on 10/03/2022.
//

import UIKit

@IBDesignable extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue
              layer.cornerCurve = .continuous
              layer.masksToBounds = (newValue > 0)
        }
    }
    
    var cornerCurve: CALayerCornerCurve {
        get { return layer.cornerCurve }
        set { layer.cornerCurve = newValue }
    }
    
    @IBInspectable var masksToBounds: Bool {
        get { return layer.masksToBounds }
        set { layer.masksToBounds = newValue }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get { return layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }

    @IBInspectable var shadowOpacity: CGFloat {
        get { return CGFloat(layer.shadowOpacity) }
        set { layer.shadowOpacity = Float(newValue) }
    }

    @IBInspectable var shadowOffset: CGSize {
        get { return layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }

    @IBInspectable var shadowColor: UIColor? {
        get {
            guard let cgColor = layer.shadowColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set { layer.shadowColor = newValue?.cgColor }
    }
    
    var shadowPath: CGPath? {
        get { return layer.shadowPath }
        set { layer.shadowPath = newValue }
    }

    var shouldRasterize: Bool {
        get { return layer.shouldRasterize }
        set { layer.shouldRasterize = newValue }
    }
    
    var rasterizationScale: CGFloat {
        get { return layer.rasterizationScale }
        set { layer.rasterizationScale = newValue }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set { layer.borderColor = newValue?.cgColor }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
}
