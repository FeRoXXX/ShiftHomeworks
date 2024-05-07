//
//  HomeViewController.swift
//  HW4
//
//  Created by Александр Федоткин on 06.05.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var homeView = HomeView(delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

private extension HomeViewController {
    func setupUI() {
        view = homeView
    }
}

extension HomeViewController: HomeCollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = DishDetailViewController(dataManager: homeView.dataSource.dishesDataManager, numberOfItem: indexPath.row)
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.pushViewController(controller, animated: true)
    }
}
