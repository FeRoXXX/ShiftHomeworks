//
//  HomeViewController.swift
//  HW5
//
//  Created by Александр Федоткин on 19.05.2024.
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var homeView = HomeView(delegate: self, dataSource: dataSource)
    private var dataSource = HomeCollectionViewDataSource()
    private var dishesDataRepository: IDishesDataRepository
    
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
        convertData = data.map {
            .init(dishImage: $0.dishImage, 
                  dishName: $0.dishName,
                  cookingTime: $0.cookingTime,
                  cookingTimeImage: $0.cookingTimeImage)
        }
        dataSource.data = convertData
    }
    
    func assemblyNewController(index: Int) -> UIViewController{
        guard let data = dataRequest(from: index) else {
            fatalError(Errors.dataIsMissing.rawValue)
        }
        let presenter = DishDetailPresenter(dishDescription: data)
        let controller = DishDetailViewController(presenter: presenter)
        return controller
    }
    
    func dataRequest(from index: Int) -> DishDescriptionModel?{
        let data = dishesDataRepository.getData()
        guard data.count > index else {
            print(Errors.outOfBounds.rawValue)
            return nil
        }
        
        return data[index].dishDescription
    }
}

extension HomeViewController: HomeCollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(assemblyNewController(index: indexPath.row), animated: true)
    }
}
