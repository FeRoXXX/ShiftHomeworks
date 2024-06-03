//
//  ChoosePresenter.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

final class ChoosePresenter {
    private weak var ui: IChooseView?
    private let dataRepository: IChooseDataRepository
    private var data: [CarMarkModel] = []
    private var dataSource: IChooseDataSource
    
    init(dataRepository: IChooseDataRepository, dataSource: IChooseDataSource) {
        self.dataRepository = dataRepository
        self.dataSource = dataSource
    }
}

extension ChoosePresenter: IChoosePresenter {
    func viewLoaded(ui: IChooseView) {
        self.ui = ui
        ui.setupDataSource(dataSource: dataSource)
        data = dataRepository.getData()
        dataSource.set(model: data)
    }
    
    func getNewController(index: Int) {
        guard data.count > index else {
            print(Errors.outOfBounds.rawValue)
            return
        }
        ui?.toDetailViewController(viewController: DetailsAssembly.build(data: data[index]))
    }
}
