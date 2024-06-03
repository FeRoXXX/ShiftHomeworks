//
//  DishReceiptViewController.swift
//  HW5
//
//  Created by Александр Федоткин on 19.05.2024.
//

import UIKit

class DishReceiptViewController: UIViewController {
    private lazy var dishReceiptView = DishReceiptView()
    private let viewModel: DishReceiptViewModel
    
    init(viewModel: DishReceiptViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupUI()
        viewModel.delegate = self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

private extension DishReceiptViewController {
    func setupUI() {
        view = dishReceiptView
    }
}

extension DishReceiptViewController: DishReceiptViewModelDelegate {
    func updateData(data: DishReceiptModel) {
        dishReceiptView.setupData(data: data)
    }
}
