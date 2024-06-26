//
//  SceneDelegate.swift
//  HW5
//
//  Created by Александр Федоткин on 19.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController: HomeViewController(dishesDataRepository: DishesDataRepository()))
        window.makeKeyAndVisible()
        self.window = window
    }
}

