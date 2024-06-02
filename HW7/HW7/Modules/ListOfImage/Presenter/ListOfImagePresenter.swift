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
        
        ui.setupDataSource(dataSource: dataSource)
    }
    
    func findImageFrom(text: String) {
        dataRepository.getData(parameters: ["s": text]) { [weak self] result in
            switch result {
            case .success(let data):
                self?.dataSource.setupData(model: ReceivedImageModel(encodedImage: data))
                DispatchQueue.main.async {
                    self?.ui?.updateTable()
                }
            case .failure(let failure):
                print(failure) //TODO: make alert
            }
        }
    }
}
