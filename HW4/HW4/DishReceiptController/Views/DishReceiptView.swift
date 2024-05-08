//
//  DishReceiptView.swift
//  HW4
//
//  Created by Александр Федоткин on 07.05.2024.
//

import UIKit

class DishReceiptView: UIView {
    weak var delegate: DataManagerDelegate?
    
    private lazy var receiptTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isSelectable = false
        return textView
    }()
    
    init(delegate: DataManagerDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupUI()
        setupData()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("view doesn't exist")
    }
}

private extension DishReceiptView {
    func setupUI() {
        backgroundColor = .darkGray
        addSubviews()
        setupLayout()
    }
    
    func addSubviews() {
        addSubview(receiptTextView)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            receiptTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            receiptTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            receiptTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            receiptTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupData() {
        guard let delegate = delegate else {
            return
        }
        let data = delegate.dataManager.getData()
        receiptTextView.attributedText = NSAttributedString(string: data.dishRecipe, attributes: Fonts.systemWhite14)
    }
}
