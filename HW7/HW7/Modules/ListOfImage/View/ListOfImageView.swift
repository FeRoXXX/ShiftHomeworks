//
//  ListOfImageView.swift
//  HW7
//
//  Created by Александр Федоткин on 02.06.2024.
//

import UIKit

class ListOfImageView: UIView {
    
    var findImage: ((String?) -> Void)?
    
    private lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [helpLabel, urlTextField, findButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let helpLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Enter the name of dish to search for the image"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let urlTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .line
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.masksToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let findButton: UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(findButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private let listOfImageTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        tableView.register(ListOfImageTableViewCell.self, forCellReuseIdentifier: ListOfImageTableViewCell.identifier)
        return tableView
    }()
    
    init(delegate: ListOfImageDelegate) {
        listOfImageTableView.delegate = delegate
        super.init(frame: .zero)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ListOfImageView {
    
    func setupUI() {
        backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        addSubview(textFieldStackView)
        addSubview(listOfImageTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            textFieldStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            textFieldStackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            textFieldStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            listOfImageTableView.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 10),
            listOfImageTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            listOfImageTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            listOfImageTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ListOfImageView {
    func setupDataSource(dataSource: IListOfImageDataSource) {
        listOfImageTableView.dataSource = dataSource
    }
    
    func updateTable() {
        listOfImageTableView.reloadData()
    }
    
    func showError(error: String) {
        urlTextField.text = error
    }
    
    @objc func findButtonClicked() {
        findImage?(urlTextField.text)
    }
}
