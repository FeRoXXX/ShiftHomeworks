//
//  ListOfImageViewController.swift
//  HW7
//
//  Created by Александр Федоткин on 02.06.2024.
//

import UIKit

class ListOfImageViewController: UIViewController {
    
    private lazy var componentView = ListOfImageView(delegate: self)
    private let presenter: IListOfImagePresenter
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupClousure()
        presenter.viewLoaded(ui: self)
    }
    
    init(presenter: IListOfImagePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ListOfImageViewController {
    
    func setupUI() {
        view = componentView
    }
    
    func setupClousure() {
        componentView.findImage = { [weak self] text in
            self?.presenter.findImageFrom(text: text)
        }
    }
}

extension ListOfImageViewController: ListOfImageDelegate, IListOfImageView {
    func setupDataSource(dataSource: IListOfImageDataSource) {
        componentView.setupDataSource(dataSource: dataSource)
    }
    
    func updateTable() {
        componentView.updateTable()
    }
    
    func showError(error: String) {
        componentView.showError(error: error)
    }
}
