//
//  HomeViewController.swift
//  HW5
//
//  Created by Александр Федоткин on 19.05.2024.
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var homeView = HomeView(delegate: self)
    var dishesDataRepository: IDishesDataRepository
    
    init(dishesDataRepository: IDishesDataRepository) {
        self.dishesDataRepository = dishesDataRepository
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        dataRequest()
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
    
    func dataRequest() {
        let data = dishesDataRepository.getData()
        var convertData: [HomeViewModel] = []
        for item in data {
            convertData.append(.init(dishImage: item.dishImage, 
                                     dishName: item.dishName,
                                     cookingTime: item.cookingTime,
                                     cookingTimeImage: item.cookingTimeImage))
        }
        homeView.dataSource.data = convertData
    }
}

extension HomeViewController: HomeCollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = DishDetailRepository(dishesDataArray: dishesDataRepository.getData())
        let presenter = DishDetailPresenter(dataRepository: model, index: indexPath.row)
        let controller = DishDetailViewController(presenter: presenter)
        navigationController?.pushViewController(controller, animated: true)
    }
}
