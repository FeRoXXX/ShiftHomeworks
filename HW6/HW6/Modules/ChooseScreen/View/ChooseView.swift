//
//  ChooseView.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

import UIKit

final class ChooseView: UIView {
    
    private let selectLabel: UILabel = {
        let selectLabel = UILabel()
        selectLabel.attributedText = NSAttributedString(string: MockData.ChooseViewData.select.rawValue, attributes: Fonts.mockDataFont)
        selectLabel.textAlignment = .center
        selectLabel.textColor = .black
        selectLabel.translatesAutoresizingMaskIntoConstraints = false
        return selectLabel
    }()
    
    private let markAutoLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 343, height: 35))
        label.attributedText = NSAttributedString(string: MockData.ChooseViewData.carMark.rawValue, attributes: Fonts.mockDataFont)
        return label
    }()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorInset = .zero
        tableView.layoutMargins = .zero
        tableView.register(ChooseTableViewCell.self, forCellReuseIdentifier: ChooseTableViewCell.identifier)
        return tableView
    }()
    
    init(delegate: ChooseTableViewDelegate, dataSource: IChooseDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        super.init(frame: .zero)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ChooseView {
    func setupUI() {
        backgroundColor = Colors.backgroundColor
        addSubviews()
        setupConstraints()
        tableView.tableHeaderView = markAutoLabel
    }
    
    func addSubviews() {
        addSubview(selectLabel)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            selectLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            selectLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            tableView.topAnchor.constraint(equalTo: selectLabel.bottomAnchor, constant: 43),
            tableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

