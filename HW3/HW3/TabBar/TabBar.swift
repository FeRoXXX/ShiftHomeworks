//
//  TabBar.swift
//  HW3
//
//  Created by Александр Федоткин on 26.04.2024.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupViewControllers()
        setupSeparation()
    }
    
    private func setupViewControllers() {
        let dataManager = DataManager()
        let aboutMeController = AboutMe()
        aboutMeController.dataManager = dataManager
        aboutMeController.title = "About me"
        aboutMeController.tabBarItem.image = UIImage(systemName: "person")
        let developerSkillsController = DeveloperSkills()
        developerSkillsController.title = "Developer skills"
        developerSkillsController.dataManager = dataManager
        developerSkillsController.tabBarItem.image = UIImage(systemName: "macbook.and.visionpro")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let myHobbyController = storyboard.instantiateViewController(withIdentifier: "MyHobby") as? MyHobby else { fatalError("controller not init")}
        myHobbyController.dataManager = dataManager
        myHobbyController.tabBarItem.image = UIImage(systemName: "figure.mind.and.body")

        setViewControllers([aboutMeController, developerSkillsController, myHobbyController], animated: true)
    }
    
    private func setupSeparation() {
        let separatorView = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 1))
        separatorView.backgroundColor = .white

        tabBar.addSubview(separatorView)
        tabBar.tintColor = .red
        tabBar.barTintColor = .white
    }

}
