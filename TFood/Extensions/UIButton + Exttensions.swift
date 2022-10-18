//
//  UIButton + Exttensions.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 18.10.22.
//

import UIKit



extension UIButton {
    func setBackgroundColor( withColor color: UIColor, forState state: UIControl.State) {
        let colorImage = UIGraphicsImageRenderer(size: CGSize(width: 1, height: 1)).image { _ in
            color.setFill()
            UIBezierPath(rect: CGRect(x: 0, y: 0, width: 1, height: 1)).fill()
        }
        setBackgroundImage(colorImage, for: state)
    }
        
}
