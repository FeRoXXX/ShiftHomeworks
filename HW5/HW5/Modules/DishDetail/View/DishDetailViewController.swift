//
//  DishDetailViewController.swift
//  HW5
//
//  Created by Александр Федоткин on 19.05.2024.
//

import UIKit

class DishDetailViewController: UIViewController {
    private let presenter: DishDetailPresenter
    private lazy var dishDetailView = DishDetailView(delegate: self)
    
    init(presenter: DishDetailPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.didLoad(view: self)
    }
}

private extension DishDetailViewController {
    func setupUI() {
        view = dishDetailView
    }
}

extension DishDetailViewController: ShowReceiptDelegate, IDishDetailView {
    func nextScreenButtonTapped() {
        presenter.toNextScreen()
    }
    
    func showReceiptViewController(data: [DishesModel], index: Int) {
        let viewController = DishReceiptViewController(viewModel: DishReceiptViewModel(data: data, index: index))
        present(viewController, animated: true)
    }
    
    func set(model: DishDetailModel) {
        dishDetailView.setupData(model: model)
    }
}
