//
//  DetailsAssembly.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

final class DetailsAssembly {
    static func build(data: CarMarkModel) -> DetailsViewController {
        let presenter = DetailsPresenter(requestData: data)
        let dataSource = DetailsTableViewDataSource()
        let viewController = DetailsViewController(presenter: presenter, dataSource: dataSource)
        return viewController
    }
}
