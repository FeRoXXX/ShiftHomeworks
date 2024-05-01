//
//  IDataManager.swift
//  HW3
//
//  Created by Александр Федоткин on 27.04.2024.
//

import Foundation

protocol IDataManager {
    func getAboutMe() -> (profilePhoto: String, firstAndLastName: String, aboutCity: String)
    func getDeveloperSkills() -> (generalInformation: String, otherLanguage: String, learningResult: String)
    func getMyHobby(hobby: MyHobbyModel.Hobby) -> String
    func getMyHobbyInfo(id: Int) -> MyHobbyModel.Hobby?
}
