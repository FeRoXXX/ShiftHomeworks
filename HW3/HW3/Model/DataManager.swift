//
//  DataManager.swift
//  HW3
//
//  Created by Александр Федоткин on 27.04.2024.
//

import Foundation

class DataManager: IDataManager {
    private var aboutMeModel: AboutMeModel
    private var developerSkillsModel: DeveloperSkillsModel
    private var myHobbyModel: MyHobbyModel
    
    init(aboutMeModel: AboutMeModel, developerSkillsModel: DeveloperSkillsModel, myHobbyModel: MyHobbyModel) {
        self.aboutMeModel = aboutMeModel
        self.developerSkillsModel = developerSkillsModel
        self.myHobbyModel = myHobbyModel
    }
    
    func getAboutMe() -> (profilePhoto: String, firstAndLastName: String, aboutCity: String) {
        return (aboutMeModel.profilePhoto, 
                aboutMeModel.firstAndLastName,
                aboutMeModel.aboutCity)
    }
    
    func getDeveloperSkills() -> (generalInformation: String, otherLanguage: String, learningResult: String) {
        return (developerSkillsModel.generalInformation,
                developerSkillsModel.otherLanguage,
                developerSkillsModel.learningResult)
    }
    
    func getMyHobby(hobby: MyHobbyModel.Hobby) -> String {
        switch hobby {
        case .carDrive:
            return myHobbyModel.carDrive
        case .cooking:
            return myHobbyModel.cooking
        case .guitar:
            return myHobbyModel.playingTheGuitar
        }
    }
    
    func getMyHobbyInfo(id: Int) -> MyHobbyModel.Hobby? {
        for (index, element) in MyHobbyModel.Hobby.allCases.enumerated() where index == id {
            return element
        }
        return nil
    }
}
