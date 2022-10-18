//
//  UIIFont + Extensions.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 14.10.22.
//

import UIKit

extension UIFont{

    internal static func SFBold(withSize size: CGFloat) -> UIFont?{
        return UIFont(name: "SFUIText-Bold", size: size)
    }

    internal static func SFMedium(withSize size: CGFloat) -> UIFont?{
        return UIFont(name: "SFUIText-Medium", size: size)
    }

    internal static func SFRegular(withSize size: CGFloat) -> UIFont?{
        return UIFont(name: "SFUIText-Regular", size: size)
    }

    internal static func SFSemibold(withSize size: CGFloat) -> UIFont?{
        return UIFont(name: "SFUIText-Semibold", size: size)
    }

}
