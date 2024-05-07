//
//  DishDetailViewController.swift
//  HW4
//
//  Created by Александр Федоткин on 07.05.2024.
//

import UIKit

class DishDetailViewController: UIViewController {

    private lazy var dishDetailView = DishDetailView(dataManager: dataManager, numberOfItem: numberOfItem, delegate: self)
    let dataManager: IDishesDataManager
    let numberOfItem: Int
    
    init(dataManager: IDishesDataManager, numberOfItem: Int) {
        self.dataManager = dataManager
        self.numberOfItem = numberOfItem
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

}

private extension DishDetailViewController {
    func setupUI() {
        view = dishDetailView
    }
}

extension DishDetailViewController: ShowReceiptDelegate {
    func showReceiptViewController(_ viewController: UIViewController) {
        present(viewController, animated: true)
    }
}
