//
//  ListOfImageTableViewCell.swift
//  HW7
//
//  Created by Александр Федоткин on 02.06.2024.
//

import UIKit

class ListOfImageTableViewCell: UITableViewCell {
    private var dishImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ListOfImageTableViewCell {
    
    func setupUI() {
        separatorInset = .zero
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        addSubview(dishImageView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            dishImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            dishImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            dishImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            dishImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension ListOfImageTableViewCell {
    func setupData(model: UIImage) {
        dishImageView.image = model
    }
    
    static var identifier: String{
        String(describing: ListOfImageTableViewCell.self)
    }
}
