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
        cityLabel.textColor = .black
        return cityLabel
    }()
    
    private let arrowButton: UIButton = {
        let arrowButton = UIButton()
        arrowButton.backgroundColor = .accentColor(withOpacity: 1)
        arrowButton.setBackgroundImage(UIImage(named: "arrow"), for: .normal)
        return arrowButton
    }()
    
    private lazy var collectionView: UICollectionView = {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createBannerSection())
        collectionView.backgroundColor = .grayBackgroundColor(withOpacity: 0.5) //.accentColor(withOpacity: 1)
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseId)//временно
        collectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.reuseId)
        reloadData()
        return collectionView
    }()
    
    private lazy var dataSource: UICollectionViewDiffableDataSource<SectionKind, Int> = {
        let dataSource = UICollectionViewDiffableDataSource<SectionKind, Int>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            let section = SectionKind(rawValue: indexPath.section)!
            print(section)
            switch section {
            case .banner:
                return self.configure(cellType: BannerCell.self, with: itemIdentifier, for: indexPath)

            case .category:
                return self.configure(cellType: ProductCell.self, with: itemIdentifier, for: indexPath)
            case .catalog:
                print("qqqqqqqqqq")
               return self.configure(cellType: ProductCell.self, with: itemIdentifier, for: indexPath)

//            default:
//                return self.configure(cellType: ProductCell.self, with: itemIdentifier, for: indexPath)
            }
        }
        
        return dataSource
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .grayBackgroundColor(withOpacity: 0.5) //.grayBackgroundColor(withOpacity: 1)
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
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}



//MARK: - ConfigureCollectionViewCell & Snapshot
extension HomeViewController {
    func configure<T: ConfiguringCell>(cellType: T.Type, with itemIdentifier: Int, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else {
            fatalError("ERROR::\(cellType)")
        }
        return cell
    }
    
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<SectionKind, Int>()
        let itemPerSection = 10
        SectionKind.allCases.forEach { sectionKind in
            snapshot.appendSections([sectionKind])
            snapshot.appendItems([1,2,3,4,5,6,7,8,9,10], toSection: sectionKind)//need fix!!!
        }
        dataSource.apply(snapshot, animatingDifferences: true)
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
       
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(190))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}



//MARK: - Diffable DataSource & Delegate























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


