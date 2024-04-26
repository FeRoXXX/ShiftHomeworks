//
//  Model.swift
//  HW3
//
//  Created by Александр Федоткин on 26.04.2024.
//

import Foundation

enum Model: String, CaseIterable {
    case profilePhoto = "profilePhoto"
    case firstAndLastName = "Александр Федоткин"
    case aboutCity = "Родился в Новосибирске и живу тут уже 21 год."
    case generalInformation = "Программированием начал заниматься ещё в школе, после школы поступил в ВУЗ на направление ИВТ.\nЯзык swift начал изучать осенью 2023 года и за пол года набрался навыков для прохождения курсов ШИФТ."
    case otherLanguage = "Помимо языка swift, изучал такие языки как, C/C++, Java Script, Python, (PascalABC, HTML :) ). \nНа языках C/C++ полностью проходят курс в ВУЗе, остальные изучал самостоятельно во время написания учебной практики\n          Нажмите сюда."
    case learningResult = "От обучения жду закрепления ранее изученных материалов, а также изучить, то с чем ещё не был знаком. \nТакже попробовать попасть в штат сотрудников компании цфт"
    case playingTheGuitar = "В свободное время я люблю играть на гитаре, изучать новые аккорды, а также пробовать играть песни с помощью табов."
    case cooking = "Также мне нравиться готовить, в основном это грузинская кухня."
    case carDrive = "После написания кода стараюсь выбраться на улицу и прокатиться на машине."
    case defaultEmpty = "Empty"
    
    enum Hobby: String, CaseIterable {
        case guitar = "Игра на гитаре"
        case cooking = "Готовка"
        case carDrive = "Езда на машине"
    }
}

class DataManager : IDataManagerProtocol {
    func getData(from id: Int) -> Model? {
        for (index, element) in Model.allCases.enumerated() {
            if id == index {
                return element
            }
        }
        return nil
    }
    
    func getHobby(from id: Int) -> Model.Hobby? {
        for (index, element) in Model.Hobby.allCases.enumerated() {
            if id == index {
                return element
            }
        }
        return nil
    }
    
    func getHobbyInfo(from text: String) -> Model {
        switch text {
        case Model.Hobby.guitar.rawValue:
            return Model.playingTheGuitar
        case Model.Hobby.cooking.rawValue:
            return Model.cooking
        case Model.Hobby.carDrive.rawValue:
            return Model.carDrive
        default:
            return Model.defaultEmpty
        }
    }
}

protocol IDataManagerProtocol {
    func getData(from id: Int) -> Model?
    func getHobby(from id: Int) -> Model.Hobby?
    func getHobbyInfo(from text: String) -> Model
}
