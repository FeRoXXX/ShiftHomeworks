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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

private extension HomeViewController {
    func setupUI() {
        view = homeView
    }
}

extension HomeViewController: HomeCollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let data = homeView.dataSource.dishesDataManager.getDescriptionData(from: indexPath.row) {
            let controller = DishDetailViewController(data: data)
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
