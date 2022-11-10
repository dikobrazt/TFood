//
//  banerCell.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 10.11.22.
//

//
//  productCell.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 18.10.22.
//

import UIKit
import SnapKit



class BannerCell: UICollectionViewCell, ConfiguringCell {
    static var reuseId: String = "cellBannerId"
    
    func configure(with itemIdentifier: Int) {
        print("1234")
    }
    
    
    private let productImageView: UIImageView = {
       let productImageView = UIImageView()
        productImageView.image = UIImage(named: "pizza2")
        productImageView.layer.cornerRadius = 15
        return productImageView
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        roundSomeCorners(forCorners: [.allCorners], withRadius: 15)
        arrangeSubViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func arrangeSubViews() {
        addSubview(productImageView)
       
    }
    
    func setUpConstraints() {
        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(32)
            make.left.equalToSuperview().inset(16)
            make.width.equalTo(132)
            make.height.equalTo(132)
        }
        
      
    }

}
