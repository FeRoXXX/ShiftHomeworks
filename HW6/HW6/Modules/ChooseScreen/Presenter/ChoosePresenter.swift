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
    
    init(dataRepository: IChooseDataRepository) {
        self.dataRepository = dataRepository
    }
}

extension ChoosePresenter: IChoosePresenter {
    func viewLoaded(ui: IChooseView) {
        self.ui = ui
        data = dataRepository.getData()
        ui.updateTableView(model: data)
    }
    
    func getNewController(index: Int) {
        guard data.count > index else {
            print(Errors.outOfBounds.rawValue)
            return
        }
        ui?.toDetailViewController(viewController: DetailsAssembly.build(data: data[index]))
    }
}
