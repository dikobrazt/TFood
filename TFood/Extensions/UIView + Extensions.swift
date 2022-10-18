//
//  UIView + Extensions.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 18.10.22.
//

import UIKit



extension UIView {
    
    func roundSomeCorners(corners: UIRectCorner, radius: Double) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
