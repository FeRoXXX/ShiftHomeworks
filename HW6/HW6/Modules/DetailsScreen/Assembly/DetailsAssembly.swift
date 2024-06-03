//
//  DetailsAssembly.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

final class DetailsAssembly {
    static func build(data: CarMarkModel) -> DetailsViewController {
        let dataSource = DetailsTableViewDataSource()
        let presenter = DetailsPresenter(requestData: data, dataSource: dataSource)
        let viewController = DetailsViewController(presenter: presenter)
        return viewController
    }
}
