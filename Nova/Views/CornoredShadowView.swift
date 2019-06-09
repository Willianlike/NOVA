//
//  CornoredShadowView.swift
//  Nova
//
//  Created by Вильян Яумбаев on 09/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit


class CornoredShadowView: UIView {
    
    private var shadowLayer: CAShapeLayer!
    
    public var cornerRadius: CGFloat = defaultCornerRadius
    public var shadowOffset = CGSize(width: 0, height: 8)
    public var shadowOpacity: Float = 0.2
    public var shadowRadius: CGFloat = 8
    public var shadowColor: UIColor = .black
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyShadow()
//        layer.cornerRadius = cornerRadius
//        layer.shadowColor = shadowColor.cgColor
//        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
//        layer.shadowOffset = shadowOffset
//        layer.shadowOpacity = shadowOpacity
//        layer.shadowRadius = shadowRadius
    }
    
}
