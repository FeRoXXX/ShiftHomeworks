//
//  HomeCollectionViewDataSource.swift
//  HW5
//
//  Created by Александр Федоткин on 19.05.2024.
//

import UIKit

class HomeCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var data: [HomeViewModel] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setupData(with: data[indexPath.row])
        return cell
    }
}
