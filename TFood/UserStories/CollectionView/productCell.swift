//
//  productCell.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 18.10.22.
//

import UIKit
import SnapKit



class ProductCell: UICollectionViewCell, ConfiguringCell {
    static var reuseId: String = "cellId"
    
    func configure(with itemIdentifier: Int) {
        print("123")
    }
    
    
    private let productImageView: UIImageView = {
       let productImageView = UIImageView()
        productImageView.image = UIImage(named: "pizza2")
        productImageView.layer.cornerRadius = 15
        return productImageView
    }()
    
    private let nameOfProductLabel: UILabel = {
        let nameOfProductLabel = UILabel()
        nameOfProductLabel.text = "Ветчина и грибы"
        nameOfProductLabel.font = .SFBold(withSize: 17)
        nameOfProductLabel.textColor = .black//.mainTextColor(alpha: 1)
        return nameOfProductLabel
    }()
    
    private let descriptionOfProductLabel: UILabel = {
        let descriptionOfProductLabel = UILabel()
        descriptionOfProductLabel.text = "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус"
        descriptionOfProductLabel.font = .SFRegular(withSize: 13)
        descriptionOfProductLabel.textColor = .secondaryTextColor(withOpacity: 1)
        descriptionOfProductLabel.lineBreakMode = .byWordWrapping
        descriptionOfProductLabel.numberOfLines = 0
        return descriptionOfProductLabel
    }()
    
    private let priceButton: UIButton = {
        let priceButton = UIButton()
        priceButton.setTitle("от 345р.", for: .normal)
        priceButton.setTitleColor(.accentColor(withOpacity: 1), for: .normal)
        priceButton.setTitleColor(.white, for: .highlighted)
        priceButton.setBackgroundColor(withColor: .white, forState: .normal)
        priceButton.setBackgroundColor(withColor: .accentColor(withOpacity: 1) ?? .white, forState: .highlighted)
        priceButton.titleLabel?.font = .SFRegular(withSize: 13)
        priceButton.layer.borderColor = UIColor.accentColor(withOpacity: 1)?.cgColor
        priceButton.layer.borderWidth = 1
        priceButton.layer.cornerRadius = 6
        return priceButton
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        roundSomeCorners(forCorners: [.topLeft, .topRight], withRadius: 15)
        arrangeSubViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func arrangeSubViews() {
        addSubview(productImageView)
        addSubview(nameOfProductLabel)
        addSubview(descriptionOfProductLabel)
        addSubview(priceButton)
    }
    
    func setUpConstraints() {
        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(32)
            make.left.equalToSuperview().inset(16)
            make.width.equalTo(132)
            make.height.equalTo(132)
        }
        
        nameOfProductLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(32)
            make.left.equalToSuperview().inset(180)
            make.width.equalTo(150)
            make.height.equalTo(25)
        }
        
        descriptionOfProductLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(60)
            make.left.equalToSuperview().inset(180)
            make.width.equalTo(171)
            make.height.equalTo(60)
        }
        
        priceButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(30)
            make.right.equalToSuperview().inset(24)
            make.width.equalTo(87)
            make.height.equalTo(32)
        }
    }

}
