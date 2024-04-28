//
//  IDataManager.swift
//  HW3
//
//  Created by Александр Федоткин on 27.04.2024.
//

import Foundation

protocol IDataManager {
    func getHobby(from id: Int) -> HardCodeTextModel.Hobby?
    func getAboutMeInfo() -> (profilePhoto: String, firstAndLastName: String, aboutCity: String)
    func getDeveloperSkillsData() -> (generalInformation: String, otherLanguage: String, learningResult: String)
    func getMyHobbyData(from text: HardCodeTextModel.Hobby) -> String
}
