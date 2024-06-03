//
//  BodyTypeTableViewCell.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

import UIKit

final class BodyTypeTableViewCell: UITableViewCell {
    private var bodyTypeLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.carMarksFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let rightImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension BodyTypeTableViewCell {
    func setupUI() {
        selectionStyle = .none
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        addSubview(bodyTypeLabel)
        addSubview(rightImage)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            bodyTypeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            bodyTypeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            rightImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            rightImage.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}

extension BodyTypeTableViewCell {
    
    func setupData(model: String, imageName: String) {
        bodyTypeLabel.text = model
        rightImage.image = UIImage(named: imageName)
    }
    
    static var identifier: String{
        String(describing: ChooseTableViewCell.self)
    }
}
