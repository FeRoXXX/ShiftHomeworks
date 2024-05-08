//
//  HomeCollectionViewCell.swift
//  HW4
//
//  Created by Александр Федоткин on 06.05.2024.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dishImageView, dishNameLabel, horizontalContentStackView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var dishNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private lazy var cookieTimeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var cookieTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var horizontalContentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cookieTimeImageView, cookieTimeLabel])
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupData(with model: DishesModel) {
        dishImageView.image = UIImage(named: model.dishImage)
        dishNameLabel.attributedText = NSAttributedString(string: model.dishName, attributes: Fonts.systemWhite20)
        cookieTimeImageView.image = UIImage(named: model.cookingTimeImage.rawValue)
        cookieTimeLabel.attributedText = NSAttributedString(string: model.cookingTime, attributes: Fonts.systemWhite20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Cell doesn't exist")
    }
}

private extension HomeCollectionViewCell {
    func setupUI() {
        backgroundColor = .clear
        addSubviews()
        setupLayout()
    }
    
    func addSubviews() {
        addSubview(contentStackView)
    }
    
    func setupLayout() {
        let marginGuide = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}

extension HomeCollectionViewCell {
    static var identifier: String{
        String(describing: HomeCollectionViewCell.self)
    }
}
