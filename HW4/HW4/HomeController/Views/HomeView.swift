//
//  HomeView.swift
//  HW4
//
//  Created by Александр Федоткин on 06.05.2024.
//

import UIKit

class HomeView: UIView {
    weak var delegate: HomeCollectionViewDelegate?
    let dataSource = HomeCollectionViewDataSource()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayoutForPortrait())
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        collectionView.backgroundColor = .clear
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    init(delegate: HomeCollectionViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        setupUI()
    }
    
    override func layoutSubviews() {
        switch UIDevice.current.orientation {
        case .portrait, .portraitUpsideDown:
            collectionView.collectionViewLayout = createCompositionalLayoutForPortrait()
        case .landscapeLeft, .landscapeRight:
            collectionView.collectionViewLayout = createCompositionalLayoutForLandscape()
        default:
            break
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("view doesn't exist")
    }
}

private extension HomeView {
    
    func createCompositionalLayoutForPortrait() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(10)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    func createCompositionalLayoutForLandscape() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.7))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item])
        group.interItemSpacing = .fixed(10)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    func setupUI() {
        backgroundColor = .darkGray
        setupSubviews()
        setupLayout()
    }
    
    func setupSubviews() {
        addSubview(collectionView)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
