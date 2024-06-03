//
//  ChooseScreenAssembly.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

final class ChooseScreenAssembly {
    static func build() -> ChooseViewController {
        let dataRepository = ChooseDataRepository()
        let presenter = ChoosePresenter(dataRepository: dataRepository, dataSource: ChooseTableViewDataSource())
        let viewController = ChooseViewController(presenter: presenter)
        return viewController
    }
}
