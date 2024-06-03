//
//  DetailsView.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

import UIKit

final class DetailsView: UIView {
    var calculatePrice: (() -> Void)?
    
    private lazy var componentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [carModelImageView, priceMockLabel, priceLabel, chooseBodyTypeLabel, bodyTypeTableView, calculatePriceButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var carModelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var priceMockLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: MockData.DetailsViewData.price.rawValue, attributes: Fonts.mockDataFont)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.carMarksFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var chooseBodyTypeLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: MockData.DetailsViewData.chooseBodyType.rawValue, attributes: Fonts.mockDataFont)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var loadIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    private var bodyTypeTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(BodyTypeTableViewCell.self, forCellReuseIdentifier: BodyTypeTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorInset = .zero
        return tableView
    }()
    
    private lazy var calculatePriceButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.3669954538, green: 0.6900835633, blue: 0.4579467177, alpha: 1)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.setTitle(MockData.DetailsViewData.calculatePrice.rawValue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(updatePrice), for: .touchUpInside)
        return button
    }()
    
    init(delegate: DetailsTableViewDelegate) {
        bodyTypeTableView.delegate = delegate
        super.init(frame: .zero)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension DetailsView {
    func setupUI() {
        backgroundColor = Colors.backgroundColor
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        addSubview(componentStackView)
        addSubview(loadIndicator)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            componentStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            componentStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 26),
            componentStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -26),
            componentStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            carModelImageView.heightAnchor.constraint(equalToConstant: 196),
            calculatePriceButton.heightAnchor.constraint(equalToConstant: 51),
            loadIndicator.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            loadIndicator.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    @objc func updatePrice() {
        calculatePrice?()
    }
}

extension DetailsView {
    
    func startIndicator() {
        componentStackView.isHidden = true
        loadIndicator.startAnimating()
    }
    
    func stopIndicator() {
        componentStackView.isHidden = false
        loadIndicator.isHidden = true
        loadIndicator.stopAnimating()
    }
     
    func setupImage(model: String) {
        carModelImageView.image = UIImage(named: model)
    }
    
    func reloadData() {
        bodyTypeTableView.reloadData()
    }
    
    func setupPrice(model: String) {
        priceLabel.text = model
    }
    
    func setupDataSource(dataSource: IDetailsTableViewDataSource) {
        bodyTypeTableView.dataSource = dataSource
    }
}
