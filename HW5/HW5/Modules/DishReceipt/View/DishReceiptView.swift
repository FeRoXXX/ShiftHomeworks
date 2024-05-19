//
//  DishReceiptView.swift
//  HW5
//
//  Created by Александр Федоткин on 19.05.2024.
//

import UIKit

class DishReceiptView: UIView {
    
    private lazy var receiptTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isSelectable = false
        return textView
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("view doesn't exist")
    }
}

extension DishReceiptView {
    func setupData(data: DishReceiptModel) {
        receiptTextView.attributedText = NSAttributedString(string: data.dishRecipe, attributes: Fonts.systemWhite14)
        print("Data updated")
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
}
