//
//  DishReceiptViewController.swift
//  HW4
//
//  Created by Александр Федоткин on 07.05.2024.
//

import UIKit

class DishReceiptViewController: UIViewController {
    private let data: DishDescriptionModel
    private lazy var dishReceiptView = DishReceiptView(data: data)
    
    init(data: DishDescriptionModel) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
        setupUI()
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
