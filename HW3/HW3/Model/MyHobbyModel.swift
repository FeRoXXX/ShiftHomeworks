//
//  MyHobbyModel.swift
//  HW3
//
//  Created by Александр Федоткин on 01.05.2024.
//

import Foundation

struct MyHobbyModel {
    let playingTheGuitar: String
    let cooking: String
    let carDrive: String
    
    enum Hobby: String, CaseIterable {
        case guitar = "Игра на гитаре"
        case cooking = "Готовка"
        case carDrive = "Езда на машине"
    }
}
