//
//  DishDetailView.swift
//  HW5
//
//  Created by Александр Федоткин on 19.05.2024.
//

import UIKit

class DishDetailView: UIView {
    var nextButtonTapped: (() -> Void)?
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dishImageView,
                                                       dishNameLabel,
                                                       dishDescriptionLabel,
                                                       showReceiptButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var dishNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dishDescriptionLabel: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.numberOfLines = 0
        return textView
    }()
    
    private lazy var showReceiptButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(string: "Показать рецепт", attributes: Fonts.systemWhite14), for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showViewController), for: .touchUpInside)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("view doesn't exist")
    }
    
    override func layoutSubviews() {
        switch UIDevice.current.orientation {
        case .portrait:
            dishImageView.isHidden = false
        case .landscapeLeft, .landscapeRight:
            dishImageView.isHidden = true
        default:
            break
        }
    }
}

extension DishDetailView {
    func setupData(model: DishDetailModel) {
        dishImageView.image = UIImage(named: model.dishImage)
        dishNameLabel.attributedText = NSAttributedString(string: model.dishName, attributes: Fonts.systemWhite20)
        dishDescriptionLabel.attributedText = NSAttributedString(string: model.dishDescription, attributes: Fonts.systemWhite14)
    }
}

private extension DishDetailView {
    func setupUI() {
        backgroundColor = .darkGray
        setupSubviews()
        setupLayout()
    }
    
    func setupSubviews() {
        addSubview(contentStackView)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            contentStackView.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor),
            dishImageView.heightAnchor.constraint(equalTo: dishImageView.widthAnchor, multiplier: 0.7)
        ])
    }
    
    @objc func showViewController() {
        nextButtonTapped?()
    }
}
