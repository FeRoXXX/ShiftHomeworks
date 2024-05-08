//
//  DishDetailViewController.swift
//  HW4
//
//  Created by Александр Федоткин on 07.05.2024.
//

import UIKit

class DishDetailViewController: UIViewController {

    private lazy var dishDetailView = DishDetailView(delegate: self)
    let dataManager: IDishesDescriptionDataManager
    
    init(dataManager: IDishesDescriptionDataManager) {
        self.dataManager = dataManager
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

}

private extension DishDetailViewController {
    func setupUI() {
        view = dishDetailView
    }
}

extension DishDetailViewController: ShowReceiptDelegate {
    func showReceiptViewController() {
        let viewController = DishReceiptViewController(dataManager: dataManager)
        present(viewController, animated: true)
    }
}
