//
//  IChoosePresenter.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

protocol IChoosePresenter {
    func viewLoaded(ui: IChooseView)
    func getNewController(index: Int)
}
