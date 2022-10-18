//
//  UIColor + Extensions.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 14.10.22.
//

import UIKit

extension UIColor {
    
    internal static func accentColor(alpha:  CGFloat) -> UIColor? {
        return UIColor(red: 253.0/255.0, green: 58.0/255.0, blue: 105.0/255.0, alpha: alpha)
    }
    
    internal static func mainTextColor(alpha:  CGFloat) -> UIColor? {
        return UIColor(red: 157.0/255.0, green: 162.0/255.0, blue: 175.0/255.0, alpha: alpha)
    }
    
    internal static func inActiveColor(alpha:  CGFloat) -> UIColor? {
        return UIColor(red: 195.0/255.0, green: 196.0/255.0, blue: 201.0/255.0, alpha: alpha)
    }
    
    internal static func secondaryTextColor(alpha:  CGFloat) -> UIColor? {
        return UIColor(red: 170.0/255.0, green: 170.0/255.0, blue: 173.0/255.0, alpha: alpha)
    }
    
    internal static func grayBackgroundColor(alpha:  CGFloat) -> UIColor? {
        return UIColor(red: 229.0/255.0, green: 229.0/255.0, blue: 229.0/255.0, alpha: alpha)
    }
    
}
