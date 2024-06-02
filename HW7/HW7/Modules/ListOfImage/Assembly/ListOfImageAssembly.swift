//
//  ListOfImageAssembly.swift
//  HW7
//
//  Created by Александр Федоткин on 02.06.2024.
//

class ListOfImageAssembly {
    static func build() -> ListOfImageViewController {
        let dataSource = ListOfImageDataSource()
        let dataRepository = ListOfImageDataRepository()
        let presenter = ListOfImagePresenter(dataRepository: dataRepository, dataSource: dataSource)
        let viewController = ListOfImageViewController(presenter: presenter)
        return viewController
    }
}
