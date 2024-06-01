//
//  ChooseViewController.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

import UIKit

final class ChooseViewController: UIViewController {
    private let presenter: IChoosePresenter
    private lazy var componentsView = ChooseView(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        presenter.viewLoaded(ui: self)
    }
    
    init(presenter: IChoosePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ChooseViewController {
    
    func setupUI() {
        view = componentsView
    }
}

extension ChooseViewController: ChooseTableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.getNewController(index: indexPath.row)
    }
}

extension ChooseViewController: IChooseView {
    
    func toDetailViewController(viewController: DetailsViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func setupDataSource(dataSource: IChooseDataSource) {
        componentsView.setupDataSource(dataSource: dataSource)
    }
}
