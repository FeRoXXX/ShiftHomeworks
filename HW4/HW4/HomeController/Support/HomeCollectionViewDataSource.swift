//
//  HomeCollectionViewDataSource.swift
//  HW4
//
//  Created by Александр Федоткин on 06.05.2024.
//

import UIKit

class HomeCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var dishesDataManager: IDishesDataRepository = DishesDataRepository()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dishesDataManager.getCountOfData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let data = dishesDataManager.getDataFromIndex(from: indexPath.row) {
            cell.setupData(with: data)
        }
        return cell
    }
}
