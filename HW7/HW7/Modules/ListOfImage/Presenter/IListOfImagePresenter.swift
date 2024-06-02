//
//  IListOfImagePresenter.swift
//  HW7
//
//  Created by Александр Федоткин on 02.06.2024.
//

import Foundation

protocol IListOfImagePresenter {
    func viewLoaded(ui: IListOfImageView)
    func findImageFrom(text: String?)
}
