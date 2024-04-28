//
//  DataManager.swift
//  HW3
//
//  Created by Александр Федоткин on 27.04.2024.
//

import Foundation

class DataManager: IDataManager {
    private var model : HardCodeTextModel
    
    init(model: HardCodeTextModel) {
        self.model = model
    }
    
    func getHobby(from id: Int) -> HardCodeTextModel.Hobby? {
        for (index, element) in HardCodeTextModel.Hobby.allCases.enumerated() where index == id {
            return element
        }
        return nil
    }
    
    func getAboutMeInfo() -> (profilePhoto: String, firstAndLastName: String, aboutCity: String) {
        let profilePhoto = model.profilePhoto
        let firstAndLastName = model.firstAndLastName
        let aboutCity = model.aboutCity
        return (profilePhoto, firstAndLastName, aboutCity)
    }
    
    func getDeveloperSkillsData() -> (generalInformation: String, otherLanguage: String, learningResult: String) {
        let generalInformation = model.generalInformation
        let otherLanguage = model.otherLanguage
        let learningResult = model.learningResult
        return (generalInformation, otherLanguage, learningResult)
    }
    
    func getMyHobbyData(from text: HardCodeTextModel.Hobby) -> String {
        switch text {
        case .carDrive:
            return model.carDrive
        case .cooking:
            return model.cooking
        case .guitar:
            return model.playingTheGuitar
        }
    }
}
