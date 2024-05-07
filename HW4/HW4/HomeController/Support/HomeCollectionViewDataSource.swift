//
//  HomeCollectionViewDataSource.swift
//  HW4
//
//  Created by Александр Федоткин on 06.05.2024.
//

import UIKit

class HomeCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var dishesDataManager: IDishesDataManager = DishesDataManager()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dishesDataManager.getCountOfData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setupData(with: dishesDataManager.getDataFromIndex(from: indexPath.row))
        return cell
    }
}
