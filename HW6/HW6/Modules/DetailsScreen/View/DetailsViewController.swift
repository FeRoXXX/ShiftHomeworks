//
//  DetailsViewController.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

import UIKit

final class DetailsViewController: UIViewController {
    private lazy var detailsView: DetailsView = DetailsView(delegate: self)
    private let presenter: IDetailsPresenter

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupClousure()
        presenter.loadView(ui: self)
    }
    
    init(presenter: IDetailsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension DetailsViewController {
    func setupUI() {
        view = detailsView
    }
    
    func setupClousure() {
        detailsView.calculatePrice = { [weak self] in
            self?.presenter.calculatePrice()
        }
    }
}

extension DetailsViewController: DetailsTableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.updateSelected(index: indexPath.row)
    }
}

extension DetailsViewController: IDetailsView {
    func updateTable() {
        detailsView.reloadData()
    }
    
    func stopIndicator() {
        detailsView.stopIndicator()
    }
    
    func startIndicator() {
        detailsView.startIndicator()
    }
    
    func setupDataSource(dataSource: IDetailsTableViewDataSource) {
        detailsView.setupDataSource(dataSource: dataSource)
    }
    
    func updateCarImage(model: String) {
        detailsView.setupImage(model: model)
    }
    
    func updateCarPrice(model: String) {
        detailsView.setupPrice(model: model)
    }
}

