//
//  ChooseTableViewCell.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

import UIKit

final class ChooseTableViewCell: UITableViewCell {
    private let circleImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: MockData.ChooseViewData.circle.rawValue))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var markNameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.carMarksFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let rightItemLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: MockData.ChooseViewData.selectForCell.rawValue, attributes: Fonts.rightItemTableFont)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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

private extension ChooseTableViewCell {
    func setupUI() {
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        addSubview(circleImageView)
        addSubview(markNameLabel)
        addSubview(rightItemLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            circleImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            circleImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            markNameLabel.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 16),
            markNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            rightItemLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            rightItemLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}

extension ChooseTableViewCell {
    func setupData(data: String) {
        markNameLabel.text = data
    }
    
    static var identifier: String{
        String(describing: ChooseTableViewCell.self)
    }
}
