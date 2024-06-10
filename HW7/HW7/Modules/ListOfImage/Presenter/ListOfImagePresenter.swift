//
//  ListOfImagePresenter.swift
//  HW7
//
//  Created by Александр Федоткин on 02.06.2024.
//

import Foundation

class ListOfImagePresenter {
    private weak var ui: IListOfImageView?
    private let dataRepository: ListOfImageDataRepository
    private let dataSource: IListOfImageDataSource
    
    init(dataRepository: ListOfImageDataRepository, dataSource: IListOfImageDataSource) {
        self.dataRepository = dataRepository
        self.dataSource = dataSource
    }
}

extension ListOfImagePresenter: IListOfImagePresenter {
    func viewLoaded(ui: any IListOfImageView) {
        self.ui = ui
        
        ui.setupDataSource(dataSource)
    }
    
    func findImageFrom(text: String?) {
        guard let text else {
            ui?.showError(error: Errors.errorInput.rawValue)
            return
        }
        dataRepository.getData(text: text) { [weak self] result in
            switch result {
            case .success(let data):
                self?.dataSource.setupData(model: ReceivedImageModel(encodedImage: data))
                DispatchQueue.main.async {
                    self?.ui?.updateTable()
                }
            case .failure(let failure):
                DispatchQueue.main.async {
                    self?.ui?.showError(error: failure.localizedDescription)
                }
            }
        }
    }
}
