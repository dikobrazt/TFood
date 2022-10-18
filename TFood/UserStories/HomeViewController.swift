//
//  SignInVC.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 15.03.22.
//

import UIKit
import SnapKit
import SwiftUI



class HomeViewController: UIViewController {
    
    private let cityLabel: UILabel = {
        let cityLabel = UILabel()
        cityLabel.font = .SFBold(withSize: 17)
        cityLabel.text = "Гродно"
        return cityLabel
    }()
    
    private let arrowButton: UIButton = {
        let arrowButton = UIButton()
        arrowButton.backgroundColor = .accentColor(withOpacity: 1)
        return arrowButton
    }()
    
    private lazy var collectionView: UICollectionView = {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createBannerSection())
        collectionView.backgroundColor = .accentColor(withOpacity: 1)
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: "cellId")//временно
        //collectiionView.separa
       // collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .grayBackgroundColor(withOpacity: 1)
        arrangeSubViews()
        setUpViewConstraints()
    }
    
    func arrangeSubViews() {
        view.addSubview(cityLabel)
        view.addSubview(arrowButton)
        view.addSubview(collectionView)
    }
    
    func setUpViewConstraints() {
        cityLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(60)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        
        arrowButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(85)
            make.top.equalToSuperview().inset(60)
            make.width.equalTo(14)
            make.height.equalTo(8)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}



//MARK: - CompositionalLayout
extension HomeViewController {
//    func createCompositionalLayout() -> UICollectionViewLayout {
//        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvoirment in
//            return self.createBannerSection()
//        }
//        return layout
//    }
    
    
    func createBannerSection() -> UICollectionViewCompositionalLayout {
        //let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
//        layoutItem.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)
//
//        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
//        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitem: layoutItem, count: 1)
//        layoutGroup.contentInsets = NSDirectionalEdgeInsets.init(top: 20, leading: 0.0, bottom: 0.0, trailing: 0.0)
//        layoutGroup.interItemSpacing = .fixed(0)
//
//        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
//        layoutSection.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(190))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}



//MARK: - DataSource & Delegate
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
       // cell.layer.borderWidth = 1
        //cell.separa
        //cell.layer.borderColor =
        return cell
    }
    
    
}







//MARK: - MakeCanvasXcode
struct Provider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> HomeViewController {
            return HomeViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}


