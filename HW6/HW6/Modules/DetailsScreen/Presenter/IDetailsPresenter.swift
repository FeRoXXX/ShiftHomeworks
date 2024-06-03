//
//  IDetailsPresenter.swift
//  HW6
//
//  Created by Александр Федоткин on 27.05.2024.
//

protocol IDetailsPresenter {
    func loadView(ui: IDetailsView)
    func updateSelected(index: Int)
    func calculatePrice()
}
