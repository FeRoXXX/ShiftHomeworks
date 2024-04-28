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
        let dataManager = DataManager(model: HardCodeTextModel())
        let aboutMeController = setupViewController(viewController: AboutMeViewController(), title: "About me", image: "person", dataManager: dataManager)
        let developerSkillsController = setupViewController(viewController: DeveloperSkillsViewController(), title: "Developer skills", image: "macbook.and.visionpro", dataManager: dataManager)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "MyHobby") as? MyHobbyViewController else { fatalError("controller not init")}
        let myHobbyController = setupViewController(viewController: controller, title: "My Hobby", image: "figure.mind.and.body", dataManager: dataManager)

        setViewControllers([aboutMeController, developerSkillsController, myHobbyController], animated: true)
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
