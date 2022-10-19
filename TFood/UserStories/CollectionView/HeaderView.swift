//
//  HeaderView.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 14.10.22.
//

import UIKit



final class HeaderView: UIView {
    
    private let testImageView: UIImage = {
        let testImageView = UIImage()
       // testImageView.image = UIImage(named: <#T##String#>)
        return testImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        arrangeSubViews()
        setUpViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func arrangeSubViews() {
        
    }
    
    func setUpViewConstraints() {
        
    }
}
