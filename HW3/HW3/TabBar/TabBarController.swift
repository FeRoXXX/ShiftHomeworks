//
//  TabBar.swift
//  HW3
//
//  Created by Александр Федоткин on 26.04.2024.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
        setupSeparation()
    }

}

private extension TabBarController {
    func setupViewControllers() {
        let dataManager = setupDataManager()
        let aboutMeController = setupViewController(viewController: AboutMeViewController(), title: "About me", image: "person", dataManager: dataManager)
        let developerSkillsController = setupViewController(viewController: DeveloperSkillsViewController(), title: "Developer skills", image: "macbook.and.visionpro", dataManager: dataManager)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "MyHobby") as? MyHobbyViewController else { fatalError("controller not init")}
        let myHobbyController = setupViewController(viewController: controller, title: "My Hobby", image: "figure.mind.and.body", dataManager: dataManager)

        setViewControllers([aboutMeController, developerSkillsController, myHobbyController], animated: true)
    }
    
    func setupDataManager() -> DataManager {
        let aboutMe = AboutMeModel(profilePhoto: "profilePhoto", 
                                   firstAndLastName: "Александр Федоткин",
                                   aboutCity: "Родился в Новосибирске и живу тут уже 21 год.")
        let developerSkills = DeveloperSkillsModel(generalInformation: "Программированием начал заниматься ещё в школе, после школы поступил в ВУЗ на направление ИВТ.\nЯзык swift начал изучать осенью 2023 года и за пол года набрался навыков для прохождения курсов ШИФТ.",
                                                   otherLanguage: "Помимо языка swift, изучал такие языки как, C/C++, Java Script, Python, (PascalABC, HTML :) ). \nНа языках C/C++ полностью проходят курс в ВУЗе, остальные изучал самостоятельно во время написания учебной практики\n          Нажмите сюда.",
                                                   learningResult: "От обучения жду закрепления ранее изученных материалов, а также изучить, то с чем ещё не был знаком. \nТакже попробовать попасть в штат сотрудников компании цфт")
        let myHobby = MyHobbyModel(playingTheGuitar: "В свободное время я люблю играть на гитаре, изучать новые аккорды, а также пробовать играть песни с помощью табов.",
                                   cooking: "Также мне нравиться готовить, в основном это грузинская кухня.",
                                   carDrive: "После написания кода стараюсь выбраться на улицу и прокатиться на машине.")
        let dataManager = DataManager(aboutMeModel: aboutMe, developerSkillsModel: developerSkills, myHobbyModel: myHobby)
        return dataManager
    }
    
    func setupViewController<T: IUsingDatas & UIViewController>(viewController: T, title: String, image: String, dataManager: DataManager) -> T {
        var controller = viewController
        controller.dataManager = dataManager
        controller.title = title
        controller.tabBarItem.image = UIImage(systemName: image)
        return controller
    }
    
    func setupSeparation() {
        let separatorView = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 1))
        separatorView.backgroundColor = .white

        tabBar.addSubview(separatorView)
        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = .white
    }
}
